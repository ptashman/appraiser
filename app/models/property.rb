class Property < ActiveRecord::Base
	
	def rental?
		price.include?("/mo") if price
	end

	def bed_count
    case
    when beds == nil
    	nil
    when beds.to_i >= 7
      7
    when beds.to_i <= 1
      1
    else
    	beds.to_i
    end
	end

	def room_demand
		census_record = CensusRecord.cached_find_by_zip(zip)
		if census_record && bed_count
			households = census_record.send(:"households#{bed_count}_person")
			similar_count = similar_properties.count
			similar_count > 0 ? (households / similar_count) : households
		end
	end

	def similar_properties
		@similar_properties ||= Property.within_zip(zip).where(beds: beds).where(bathrooms: bathrooms)
	end

	def cap_ratio
		avg_purchase_price_in_zip = Property.avg_purchase_price_for(Property.within_zip(zip))
		avg_rental_price_in_zip = Property.avg_rental_price_for(Property.within_zip(zip))
		if (avg_rental_price_in_zip && avg_purchase_price_in_zip) && avg_purchase_price_in_zip != 0
      avg_rental_price_in_zip / avg_purchase_price_in_zip
    end
	end

	def score
		if room_demand && cap_ratio
		  (room_demand + (100000 * cap_ratio)).round(5)
		end
	end

	def top_ten_in_state(state)
		Property.where(state: state).sort_by { |p| p.score }.first(10).map { |p| "Property #{p.id} has a score of #{p.score}" }
	end

private

	def self.avg(arr)
		(arr.reduce(:+).to_f / arr.size)
	end

	def self.within_zip(zip)
		if @properties_in_zip && @properties_in_zip.first.try(:zip) == zip
			@properties_in_zip
		else
			@properties_in_zip = where(zip: zip)
		end
	end

	def self.avg_purchase_price_for(properties)
		properties = properties.reject { |p| p.price.nil? }
    purchase_prices = properties.map { |p| p.price[1..-1].to_i unless p.rental? }
		purchase_prices.compact!.reject! { |x| x == 0 }    													
    avg(purchase_prices.compact) unless purchase_prices.empty?
  end

  def self.avg_rental_price_for(properties)
  	properties = properties.reject { |p| p.price.nil? }
  	rental_prices = properties.map { |p| p.price[1..-1].to_i if p.rental? }
    rental_prices.compact!.reject! { |x| x == 0 }
    avg(rental_prices) unless rental_prices.empty?
  end
end

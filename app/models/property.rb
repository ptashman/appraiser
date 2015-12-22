class Property < ActiveRecord::Base
	def rental?
		price.include?("/mo") if price
	end

	def room_demand
		if census_record = CensusRecord.find_by_zip(zip)
			households = census_record.send(:"households#{beds.to_i}_person")
			households / similar.count
		end
	end

	def similar
		Property.where(beds: beds)
						.where(bathrooms: bathrooms)
		    		.where(zip: zip) - [self]
	end

	def avg_purchase_price_in_zip
    purchase_prices = Property.where(zip: zip)
    													.where('price IS NOT NULL')
    													.map { |p| p.price[1..-1].to_i unless p.rental? }
		purchase_prices.compact!.reject! { |x| x == 0 }    													
    avg(purchase_prices.compact) unless purchase_prices.empty?
  end

  def avg_rental_price_in_zip
  	rental_prices = Property.where(zip: zip)
  													.where('price IS NOT NULL')
  													.map { |p| p.price[1..-1].to_i if p.rental? }
    rental_prices.compact!.reject! { |x| x == 0 }
    avg(rental_prices) unless rental_prices.empty?
  end

	def cap_ratio
    avg_rental_price_in_zip / avg_purchase_price_in_zip
	end

	def score
		(room_demand + (100000 * cap_ratio)).round(5)
	end

private

	def avg(arr)
		(arr.reduce(:+).to_f / arr.size)
	end
end

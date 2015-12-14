Dir.glob('/Users/paul/rails_apps/zillow/*.csv') do |csv|
  if File.open(csv) { |f| f.count } > 5
    File.open(csv) do |f|
      f.each do |current_file|
        puts line_array = current_file.gsub('"', '').split(",") rescue nil
        zip_code = ""
        line_array.each { |e| zip_code = e if e.match(/^\d{5}(?:[-\s]\d{4})?$/) }
        if !zip_code.blank?
        	zip_index = line_array.index(zip_code)
        	address_indexes = (1..zip_index-3).to_a
        	address1 = ""
        	address_indexes.each { |i| address1 += "#{line_array[i]} " }
          p = Property.create(address1: address1.strip, city: line_array[zip_index-2], state: line_array[zip_index-1], zip: zip_code) rescue nil
     	    details = ""
     	    puts line_array
     	    line_array.each { |e| details = e if e.include?("•") }
     	    if !details.blank?
     	      details_index = line_array.index(details)
     	      if (details_index - zip_index) > 2
     	      	price = ""
     	        line_array[zip_index+1..details_index-1].each { |e| price += e }
     	      else
     	      	price = line_array[details_index-1]
     	      end
            sqfeet = details.split(" • ")[-1]
            line_array[details_index+1..-1].each { |e| sqfeet += e }
            sqfeet.gsub!("\n", "")
            p.update_attributes!(price: price, beds: details.split(" • ")[0], bathrooms: details.split(" • ")[1], sqfeet: sqfeet)
          end
        end
      end
    end
  end
end
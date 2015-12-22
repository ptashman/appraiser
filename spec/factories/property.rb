FactoryGirl.define do
	factory :rental_property_1, class: Property do
		zip       "12345"
		beds      "1 bd"
		bathrooms "1 ba"
		sqfeet    "1111 sqft"
		price     "$1000/mo"
	end

	factory :rental_property_2, class: Property do
		zip       "12345"
		beds      "3 bds"
		bathrooms "2 ba"
		sqfeet    "2222 sqft"
		price     "$2000/mo"
	end

	factory :purchase_property_1, class: Property do
    zip       "12345"
    beds      "3 bds"
    bathrooms "2 ba"
    sqfeet    "3333 sqft"
    price     "$300000"
	end

	factory :purchase_property_2, class: Property do
    zip       "12345"
    beds      "3 bds"
    bathrooms "2 ba"
    sqfeet   "4444 sqft"
    price     "$400000"
	end

	factory :purchase_property_3, class: Property do
    zip       "54321"
    beds      "3 bds"
    bathrooms "2 ba"
    sqfeet    "2222 sqft"
    price     "$500000"
	end
end
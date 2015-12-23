require 'rails_helper'

RSpec.describe Property, :type => :model do
  let!(:rental_property_1)   { FactoryGirl.create(:rental_property_1) }
  let!(:rental_property_2)   { FactoryGirl.create(:rental_property_2) }
  let!(:purchase_property_1) { FactoryGirl.create(:purchase_property_1) }
  let!(:purchase_property_2) { FactoryGirl.create(:purchase_property_2) }
  let!(:purchase_property_3) { FactoryGirl.create(:purchase_property_3) }
  let!(:census_record)       { FactoryGirl.create(:census_record) }

  describe "rental?" do
  	it "should return true for rental properties" do
  		expect(rental_property_1.rental?).to be true
  		expect(rental_property_2.rental?).to be true
  	end

  	it "should return false for purchase properties" do
  		expect(purchase_property_1.rental?).to be false
  		expect(purchase_property_2.rental?).to be false
  		expect(purchase_property_3.rental?).to be false
  	end
  end

  describe "room_demand" do
    it "should return the 555 for purchase property 1" do
    	expect(purchase_property_1.room_demand).to eq 166
    end
  end

  describe "similar_properties" do
  	it "should return all similar properties" do
      similar = [rental_property_2, purchase_property_1, purchase_property_2]
  		expect(purchase_property_1.similar_properties).to eq similar
  	end
  end

  describe "cap_ratio" do
  	it "should return the correct cap ration for the property's zip code" do
  		expect(purchase_property_1.cap_ratio.round(7)).to eq 0.0042857
  	end
  end

  describe "score" do
    it "should return the correct property score" do
      expect(purchase_property_1.score).to eq 594.57143
    end
  end
end

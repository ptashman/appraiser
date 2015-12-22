class CensusRecord < ActiveRecord::Base

	def households1_person
	  households - households_with_more_than_1_person
	end

	def households7_person
		households7_plus_person
	end

private

  def households_with_more_than_1_person
  	households2_person + households3_person +
    households4_person + households5_person +
    households6_person + households7_plus_person
  end
end

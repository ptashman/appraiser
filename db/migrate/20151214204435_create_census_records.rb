class CreateCensusRecords < ActiveRecord::Migration
  def change
    create_table :census_records do |t|
      t.integer :zip
			t.integer :population
			t.integer :population_male
			t.integer :population_female
			t.integer :median_age
			t.integer :median_age_male
			t.integer :median_age_female
			t.integer :population_race_white
			t.integer :population_race_black
			t.integer :population_amerindian
			t.integer :population_race_asian
			t.integer :population_race_pacific
			t.integer :population_race_other
			t.integer :population_race_multi
			t.integer :population_race_latino
			t.integer :households
			t.integer :husband_wife_households
			t.integer :single_father_household
			t.integer :single_mother_household
			t.integer :non_family_households
			t.integer :house_holder15to24
			t.integer :house_holder25to34
			t.integer :house_holder35to44
			t.integer :house_holder45to54
			t.integer :house_holder55to59
			t.integer :house_holder60to64
			t.integer :house_holder65to74
			t.integer :house_holder75to84
			t.integer :house_holder85over
			t.integer :households_with60_plus
			t.integer :households_with75_plus
			t.integer :households2_person
			t.integer :households3_person
			t.integer :households4_person
			t.integer :households5_person
			t.integer :households6_person
			t.integer :households7_plus_person
      t.timestamps null: false
    end
  end
end

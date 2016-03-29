class AddCreditScoreToCensusRecords < ActiveRecord::Migration
  def change
    add_column :census_records, :credit_score, :integer
  end
end

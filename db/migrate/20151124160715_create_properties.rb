class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :price
      t.string :beds
      t.string :bathrooms
      t.string :sqfeet
      t.timestamps null: false
    end
  end
end

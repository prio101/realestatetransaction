class CreateRealEstates < ActiveRecord::Migration[5.1]
  def change
    create_table :real_estates do |t|
      t.string  :street
      t.string  :city
      t.integer :zip
      t.string  :state
      t.integer :beds
      t.integer :baths
      t.decimal :sq_ft
      t.string  :type_of_estate
      t.datetime  :sale_date
      t.decimal :price
      t.decimal   :latitude
      t.decimal   :longtitude

      t.timestamps
    end
  end
end

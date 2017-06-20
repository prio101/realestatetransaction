class RealEstate < ApplicationRecord
  validates :street, :city, :zip, :state, :beds,
            :baths, :sq_ft, :type_of_estate,
            :sale_date, :price,
            :latitude, :longitude, presence: true
  validates :zip, :price, :latitude,
            :longitude, :sq_ft, numericality: true
end

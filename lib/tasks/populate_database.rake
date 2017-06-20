require 'csv'

namespace :populate_database do
  desc 'import data'
  task import_data: :environment do
    file = File.read("#{Rails.root}/Sacramentorealestatetransactions.csv")
    csv = CSV.parse(file, headers: true)
    puts 'Starting to populate the database, Please Wait...'
    csv.each do |row|
      row.to_hash
      populator row
      print "\e[32m*"
    end
    puts "\n"
    puts 'Completed'
  end

  private

    def populator(row)
      RealEstate.create(
        street:  row['street'],
        city: row['city'],
        zip: row['zip'],
        state: row['state'],
        beds: row['beds'],
        baths: row['baths'],
        sq_ft: row['sq__ft'],
        type_of_estate: row['type'],
        sale_date: format_date(row['sale_date']),
        price: row['price'],
        latitude: row['latitude'],
        longtitude: row['longtitude']
      )
    end

    def format_date(date)
      string = date
      Date.parse(string)
    end
end

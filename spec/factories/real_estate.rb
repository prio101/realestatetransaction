FactoryGirl.define do
  factory :real_estate do
    street  Faker::Address.street_name
    city  Faker::Address.city
    zip Faker::Number.number(4)
    state Faker::Address.state
    beds  Faker::Number.between(2,5)
    baths Faker::Number.between(2,5)
    sq_ft Faker::Number.number(4)
    type_of_estate Faker::Cat.name
    sale_date Faker::Date.between(1.year.ago, Date.today)
    price Faker::Number.number(10)
    latitude  Faker::Number.number(7)
    longitude Faker::Number.number(7)
  end
end

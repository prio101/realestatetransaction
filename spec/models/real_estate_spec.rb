require 'rails_helper'

RSpec.describe RealEstate, type: :model do
  describe 'validates presence of fields' do
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:beds) }
    it { should validate_presence_of(:baths) }
    it { should validate_presence_of(:sq_ft) }
    it { should validate_presence_of(:type_of_estate) }
    it { should validate_presence_of(:sale_date) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  describe 'validates numericality of' do
    it { should validate_numericality_of(:price) }
    it { should validate_numericality_of(:latitude) }
    it { should validate_numericality_of(:longitude) }
    it { should validate_numericality_of(:sq_ft) }
  end
end

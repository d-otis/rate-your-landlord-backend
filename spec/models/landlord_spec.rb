require 'rails_helper'
require 'pry'

RSpec.describe Landlord, type: :model do

  let(:landlord) {
    Landlord.create(
      name: 'Dan Foley'
    )
  }

  context "Landlord initialization" do
    xit 'initializes with rating: nil' do
      expect(landlord.rating).to be(nil)
    end
  end

  context "Reviews: " do
    it "review count updates with addition of reviews" do
      # landlord = Landlord.create(name: "Dan Foley")
      property = landlord.properties.create(address: 'Amber St')
      property.reviews.create(rating: 5)
      property.reviews.create(rating: 1)

      expect(landlord.reviews.count).to eq(2)
    end

    it "landlord's review count updates to 2 with 2 reviews" do
      property = landlord.properties.create(address: 'Kenmore St')

      property.reviews.create(rating: 3)
      property.reviews.create(rating: 1)

      expect(landlord.reviews.count).to eq(2)
    end
  end

  context 'Rating Updates:' do
    it 'updates Landlord rating when first review is created' do
      # landlord = Landlord.create(name: "Dan Foley")
      property = landlord.properties.create(address: 'Sansom St')
      property.reviews.create(rating: 5)
      expect(landlord.rating).to eq(5.0)
    end

    it 'updates Landlord rating when second review is created' do
      # landlord = Landlord.create(name: "Dan Foley")
      property = landlord.properties.create(address: 'Market St')
      x = property.reviews.create(rating: 5)
      landlord.properties.create(address: 'Broad St')
      y = property.reviews.create(rating: 3)

      expect(landlord.rating).to eq(4.0)

    end

    xit "initializes Property with rating: nil" do
      property = landlord.properties.create(address: 'Walnut St')
      expect(property.rating).to eq(nil)
    end

    xit "updates Property rating when first review is created" do
      property = landlord.properties.create(address: 'Chestnut St')
      property.reviews.create(rating: 5)
      expect(property.rating).to eq(5.0)
    end

    xit "updates property rating when second review is created" do
      property = landlord.properties.create(address: 'Lombard St')
      property.reviews.create(rating: 5)
      property.reviews.create(rating: 2)
      expect(property.rating).to eq(3.5)
    end

    xit "Landlord rating should be updated according to average of property reviews" do
      property1 = landlord.properties.create(address: 'Diversey St')
      property2 = landlord.properties.create(address: 'Clark Ave')

      property1.reviews.create(rating: 5)
      property1.reviews.create(rating: 4)

      property2.reviews.create(rating: 4)
      property2.reviews.create(rating: 2)

      expect(landlord.rating).to eq(3.75)
    end
  end


end

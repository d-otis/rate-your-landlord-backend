class LandlordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at
  has_many :properties
  has_many :reviews

  attribute :aggregate_rating do |ll|
    ll.property_review_avg
  end
end

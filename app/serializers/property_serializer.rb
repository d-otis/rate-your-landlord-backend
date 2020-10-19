class PropertySerializer
  include FastJsonapi::ObjectSerializer

  attributes :address, :landlord_id, :image
  has_many :reviews

  attribute :review_average do |property|
    property.review_average
  end
end

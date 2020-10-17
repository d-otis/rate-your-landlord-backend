class PropertySerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :rating, :landlord_id
  has_many :reviews
end

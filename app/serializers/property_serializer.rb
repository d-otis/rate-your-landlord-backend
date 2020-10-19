class PropertySerializer
  include FastJsonapi::ObjectSerializer
  attributes :address, :landlord_id
  has_many :reviews
end

class LandlordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :rating, :created_at
  has_many :properties
end

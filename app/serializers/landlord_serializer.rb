class LandlordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :rating
  has_many :properties
end

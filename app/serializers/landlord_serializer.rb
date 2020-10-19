class LandlordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at
  has_many :properties
end

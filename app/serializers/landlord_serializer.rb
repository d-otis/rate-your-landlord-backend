class LandlordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at, :id
  has_many :properties
  has_many :reviews

end

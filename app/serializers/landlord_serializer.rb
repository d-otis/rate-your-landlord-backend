class LandlordSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at, :id, :rating, :image_url
  has_many :properties
  has_many :reviews

end

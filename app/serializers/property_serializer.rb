class PropertySerializer
  include FastJsonapi::ObjectSerializer

  attributes :address, :landlord_id, :rating
  has_many :reviews

  attribute :has_image do |property|
    property.image.attached?
  end

  attribute :image_url do |property|
    Rails.application.routes.url_helpers.rails_blob_url(property.image, host: 'localhost:3000') if property.image.attached?
  end

end
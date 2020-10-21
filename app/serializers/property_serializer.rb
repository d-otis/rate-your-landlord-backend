class PropertySerializer
  include FastJsonapi::ObjectSerializer

  attributes :address, :landlord_id
  has_many :reviews

  attribute :review_average do |property|
    property.review_average
  end

  attribute :has_image do |property|
    property.image.attached?
  end

  attribute :image_url do |property|
    Rails.application.routes.url_helpers.rails_blob_url(property.image, host: 'localhost:3000')
  end

end
class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :rating, :property_id

  attribute :landlord_id do |review|
    review.property.landlord_id
  end

  attribute :landlord_rating do |review|
    review.property.landlord.rating
  end

  attribute :property_rating do |review|
    review.property.rating
  end
end

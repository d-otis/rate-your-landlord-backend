class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :rating, :property_id
end

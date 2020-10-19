class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :rating
end

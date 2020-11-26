class Landlord < ApplicationRecord
  has_many :properties, :dependent => :destroy
  has_many :reviews, :through => :properties

  accepts_nested_attributes_for :properties

  def set_rating
    sum_ratings = self.reviews.map {|r| r.rating}.sum
    reviews_count = self.reviews.count.to_f
    new_rating = sum_ratings / reviews_count

    self.update(rating: new_rating)
  end

  def set_random_image
    url = Unsplash::Photo.random(orientation: 'squarish', query: 'person').urls.regular
    self.image_url = url
  end
end

class Property < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  belongs_to :landlord
  
  has_one_attached :image

  def set_rating
    sum_ratings = self.reviews.map {|r| r.rating}.sum_ratings
    reviews_count = self.reviews.count.to_f
    new_rating = sum_ratings / reviews_count

    self.update(rating: new_rating)
  end
end

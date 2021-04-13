class Property < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  belongs_to :landlord

  def set_rating
    # modularize this
    sum_ratings = self.reviews.map {|r| r.rating}.sum
    reviews_count = self.reviews.count.to_f
    new_rating = sum_ratings / reviews_count

    self.update(rating: new_rating)
  end
end

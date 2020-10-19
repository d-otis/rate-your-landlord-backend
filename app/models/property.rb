class Property < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :landlord

  def review_average
    (self.reviews.collect {|review| review.rating}.flatten.sum / self.reviews.count.to_f).round(2)
  end

end

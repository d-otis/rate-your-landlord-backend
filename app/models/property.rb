class Property < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  belongs_to :landlord
  has_one_attached :image

  def review_average
    (self.reviews.collect {|review| review.rating}.flatten.sum / self.reviews.count.to_f).round(2)
  end

end

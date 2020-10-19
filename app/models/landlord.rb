class Landlord < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :properties

  def aggregate_rating
    ((personal_review_avg + properties_review_avg) / 2.0).round(2)
  end

  def personal_review_avg
    (self.reviews.collect {|review| review.rating}.sum / self.reviews.count.to_f).round(2)
  end

  def property_review_avg
    properties_review_avg = self.properties.collect do |property|
      (property.reviews.collect {|review| review.rating}.sum / property.reviews.count.to_f).round(2)
    end.sum
  end
end

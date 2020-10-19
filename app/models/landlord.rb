class Landlord < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :properties

  def aggregate_rating
    ((personal_review_avg + property_review_avg) / 2.0).round(2)
  end

  def personal_review_avg
    (self.reviews.collect {|review| review.rating}.sum / self.reviews.count.to_f).round(2)
  end

  def property_review_avg
    # 1. map all property ratings to an array
    # 2. sum that array and devide it by how 
      # many property reviews landlord has

    ratings_arr = self.properties.collect do |p|
      p.reviews.collect {|r| r.rating}
    end.flatten

    (ratings_arr.sum / ratings_arr.count.to_f).round(2)
  end
end

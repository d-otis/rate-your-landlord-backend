class Review < ApplicationRecord
  belongs_to :property

  after_create :calculate_ratings

  private

  def calculate_ratings
    calculate_property_rating
    calculate_landlord_rating
  end

  def calculate_property_rating
    property = self.property
    current_property_score = property.rating || 0
    new_score = current_property_score + (self.rating || 0)
    updated_property_rating = new_score / property.reviews.count
    self.property.update(rating: updated_property_rating)
  end

  def calculate_landlord_rating
    landlord = self.property.landlord
    current_landlord_score = landlord.rating || 0
    new_score = current_landlord_score + (self.rating || 0)
    updated_landlord_rating = new_score / landlord.reviews.count
    landlord.update(rating: updated_landlord_rating)
  end
end

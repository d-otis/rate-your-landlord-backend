class Property < ApplicationRecord
  has_many :reviews, as: :reviewable
  belongs_to :landlord
end

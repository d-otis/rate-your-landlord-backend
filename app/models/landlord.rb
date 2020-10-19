class Landlord < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :properties
end

class Property < ApplicationRecord
  belongs_to :landlord
  has_many :reviews
end

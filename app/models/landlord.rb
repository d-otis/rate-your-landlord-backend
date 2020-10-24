class Landlord < ApplicationRecord
  has_many :properties, :dependent => :destroy
  has_many :reviews, :through => :properties
end

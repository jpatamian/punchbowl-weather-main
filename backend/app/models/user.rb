class User < ApplicationRecord
  has_many :favorites
  has_many :favorite_locations, through: :favorites, source: :location
end

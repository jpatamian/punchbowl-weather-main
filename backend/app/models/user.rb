class User < ApplicationRecord
  has_many :user_favorites
  has_many :favorite_locations, through: :user_favorites, source: :location
end

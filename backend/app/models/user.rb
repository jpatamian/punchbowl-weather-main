class User < ApplicationRecord
  has_many :user_favorites, dependent: :destroy
  has_many :favorite_locations, through: :user_favorites, source: :location
end

class Location < ApplicationRecord
  validates :name, :latitude, :longitude, :slug, presence: true
  validates :name, uniqueness: true
  has_many :user_favorites
  has_many :favorited_by_users, through: :user_favorites, source: :user

  # wasn't sure if i should leave this in here
  # LAT is first, LON is second
  LOCATIONS = HashWithIndifferentAccess.new({
    new_york: ['New York, New York',  40.7128, -74.0060],
    boston: ['Boston, Massachusetts',  42.3601, -71.0589],
    chicago: ['Chicago, Illinois',  41.8781, -87.6298],
    denver: ['Denver, Colorado',  39.7392, -104.9903],
    houston: ['Houston, Texas',  29.7604, -95.3698],
    seattle: ['Seattle, Washington',  47.6062, -122.3321],
    los_angeles: ['Los Angeles, California',  34.0522, -118.2437]
  })
end

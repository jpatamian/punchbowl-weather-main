require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    Location.create!(name: 'Boston, Massachusetts', slug: 'boston', latitude: 42.3601, longitude: -71.0589)
  end

  test "can initialize location" do
    location = Location.create(name: 'New York', slug: 'new_york', latitude: 40.7128, longitude: -74.0060)
    assert_instance_of Location, location
    assert_equal 'New York', location.name
    assert_equal 40.7128, location.latitude
    assert_equal -74.0060, location.longitude
  end

  test "get location by id" do
    location = Location.find_by(slug: 'boston')
    assert_equal 'Boston, Massachusetts', location.name
  end

  test "can lookup location by coordinates" do
    location = Location.find_by(latitude: 42.3601, longitude: -71.0589)
    assert_equal 'Boston, Massachusetts', location.name
  end

  test "location lookup return city and state" do
    location = Location.find_by(latitude: 42.3601, longitude: -71.0589)
    assert_equal 'Boston, Massachusetts', location.name
  end

  test "lookup returns nil for invalid coordinates" do
    assert_nil Location.find_by(latitude: nil, longitude: nil)
  end

  # Validations
  # Note: is there a way to do this all at once with a single test?

  test "name is required" do
    location = Location.new(slug: 'new_york', latitude: 40.7128, longitude: -74.0060)
    assert_not location.save
    assert_not location.valid?
  end

  test "slug is required" do
    location = Location.new(name: 'New York', latitude: 40.7128, longitude: -74.0060)
    assert_not location.save
    assert_not location.valid?
  end

  test "latitude is required" do
    location = Location.new(name: 'New York', slug: 'new_york', longitude: -74.0060)
    assert_not location.save
    assert_not location.valid?
  end

  test "longitude is required" do
    location = Location.new(name: 'New York', slug: 'new_york', latitude: 40.7128)
    assert_not location.save
    assert_not location.valid?
  end

  # End Validations
end

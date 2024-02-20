require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "can initialize location" do
    location = Location.new('New York', 40.7128, -74.0060)
    assert_instance_of Location, location
    assert_equal 'New York', location.name
    assert_equal 40.7128, location.lat
    assert_equal -74.0060, location.lon
  end

  test "get location by id" do
    location = Location.get(:boston)
    assert_equal 'Boston, Massachusetts', location.name
  end

  test "can lookup location by coordinates" do
    location = Location.lookup(lat: 42.2793, lon: -71.4162)
    assert_match /^Framingham/, location.name
  end

  test "location lookup return city and state" do
    skip
    location = Location.lookup(lat: 42.2793, lon: -71.4162)
    assert_equal 'Framingham, Massachusetts', location.name
  end

  test "lookup returns nil for invalid coordinates" do
    assert_nil Location.lookup(lat: nil, lon: nil)
  end
end

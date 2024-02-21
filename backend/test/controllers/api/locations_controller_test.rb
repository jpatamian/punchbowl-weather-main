require 'test_helper'

class Api::LocationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    Location.create!(name: 'Boston, Massachusetts', slug: 'boston', latitude: 42.3601, longitude: -71.0589)
  end

  test 'location index returns json' do
    get api_locations_path, as: :json
    assert_response :success
    assert response.parsed_body
  end

  test 'location index returns correct data' do
    get api_locations_path, as: :json
    assert_response :success

    # Boston exists from the fixtures location.yml file
    assert_equal response.parsed_body.length, Location.count
    assert_equal response.parsed_body[0]['slug'], 'boston'
  end
end


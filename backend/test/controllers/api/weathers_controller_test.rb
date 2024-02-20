require 'test_helper'

class Api::WeathersControllerTest < ActionDispatch::IntegrationTest
  test 'get the weather returns json' do
    get api_location_weather_path(:boston), as: :json
    assert_response :success

    assert response.parsed_body['current']
  end
end


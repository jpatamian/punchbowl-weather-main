require 'test_helper'

class Api::WeathersControllerTest < ActionDispatch::IntegrationTest
  test 'get the weather returns json' do
    get api_location_weather_path(:north_pole), as: :json
    assert_response :success

    assert response.parsed_body['current']
  end

  test 'it returns Not Found for invalid location' do
    get api_location_weather_path(:not_a_real_location), as: :json
    assert_response :not_found
  end
end


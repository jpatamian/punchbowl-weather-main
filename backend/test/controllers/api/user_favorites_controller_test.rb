require 'test_helper'

class Api::UserFavoritesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create
    @user.favorite_locations << locations(:north_pole)
  end

  test 'user favorites index returns json' do
    get api_user_favorites_path, as: :json
    assert_response :success
    assert response.parsed_body
  end

  test 'user favorites index returns correct data' do
    get api_user_favorites_path, as: :json
    assert_response :success

    assert_equal response.parsed_body.length, 1
    assert_equal response.parsed_body[0]['location_id'], locations(:north_pole).id
  end

  test 'user favorites create returns success' do
    post api_user_favorites_path, params: { location_id: locations(:sleepy_hollow).id }, as: :json
    assert_response :created
    assert_equal @user.favorite_locations.count, 2
  end

  test 'user favorites delete returns success' do
    delete api_user_favorite_path(locations(:north_pole).id), as: :json
    assert_response :no_content
    assert_equal @user.favorite_locations.count, 0
  end
end

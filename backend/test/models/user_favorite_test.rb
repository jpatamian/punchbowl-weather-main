require "test_helper"

class UserFavoriteTest < ActiveSupport::TestCase
  test 'favorite is valid' do
    favorite = UserFavorite.new(user: User.new, location: locations(:north_pole))
    assert favorite.valid?
  end

  test 'favorite is invalid without a user' do
    favorite = UserFavorite.new(location: locations(:north_pole))
    refute favorite.valid?
    assert_not_nil favorite.errors[:user]
  end

  test 'a user favorite is associated with both a user and a location' do
    user = User.new
    favorite = UserFavorite.create(user: user, location: locations(:north_pole))

    assert user.favorite_locations.include?(locations(:north_pole))
    assert locations(:north_pole).favorited_by_users.include?(user)
    assert user.user_favorites.include?(favorite)
  end
end

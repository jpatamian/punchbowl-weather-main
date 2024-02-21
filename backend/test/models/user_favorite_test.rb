# require "test_helper"

# class UserFavoriteTest < ActiveSupport::TestCase
#   test "favorite is valid" do
#     favorite = UserFavorite.new(user: users(:one), location: locations(:one))
#     assert favorite.valid?
#   end

#   test "favorite is invalid without a user" do
#     favorite = UserFavorite.new(location: locations(:one))
#     refute favorite.valid?
#     assert_not_nil favorite.errors[:user]
#   end
# end

class Api::UserFavoritesController < ApplicationController
  before_action :set_user!, only: [:index, :create, :destroy]

  def index
    render json: user.user_favorites, status: :ok
  end

  def create
    location = Location.find_by(id: params[:location_id])

    if location.nil?
      render json: { error: "Location not found" }, status: :not_found
      return
    end

    user.favorite_locations << location

    render json: location, status: :created
  end

  def destroy
    location = Location.find_by(id: params[:id])

    if location.nil?
      render json: { error: "Location not found" }, status: :not_found
      return
    end

    user.favorite_locations.delete(location)

    head :no_content
  end

  private

  attr_reader :user

  def set_user!
    @user = User.first
  end

end

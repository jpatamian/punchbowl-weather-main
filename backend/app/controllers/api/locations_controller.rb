class Api::LocationsController < ApplicationController
  def index
  locations = Rails.cache.fetch('all_locations', expires_in: 1000.days) do
    Location.all
  end

    render json: locations, status: :ok
  rescue StandardError => e
    Rails.logger.error "Error occurred in LocationsController#index with: #{e.message}."
    render json: { error: e.message }, status: :internal_server_error
  end
end

# Things I could do here for a Real App
# Add a Serializer to control exactly what is returned to the front end
# Filtering and sorting abilities
# Pagination - if we had more locations


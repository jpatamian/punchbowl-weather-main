class Api::LocationsController < ApplicationController
  def index
    # low level caching using the cache_key which is a hash of the max updated_at
    locations = Rails.cache.fetch(Location.cache_key) do
      Location.all.order(:name)
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


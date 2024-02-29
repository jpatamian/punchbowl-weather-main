class Api::LocationsController < ApplicationController
  def index
    # low level caching using the cache_key which is a hash of the max updated_at
    # locations = Rails.cache.fetch(Location.cache_key) do
    #   Location.all.order(:name)
    # end

    # I think the max updated at was the wrong way to go here and I should have used a time cache because the weather doesn't change much after 1 minute or so
    location_ids = Rails.cache.fetch('location_ids', expires_in: 1.minute) do
      Location.all.pluck(:id)
    end

    locations = Location.find(location_ids).order(:name)

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


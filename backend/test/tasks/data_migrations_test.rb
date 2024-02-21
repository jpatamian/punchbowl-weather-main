require 'test_helper'
require "rake"

class DataMigrationsTest < ActiveSupport::TestCase
  setup do
    Rails.application.load_tasks
    Rake::Task['data_migrations:migrate_location_data'].invoke
  end

  test 'loads data correctly' do
    assert_equal Location.count, Location::LOCATIONS.count + 1
    # +1 because of the fixture
  end
end

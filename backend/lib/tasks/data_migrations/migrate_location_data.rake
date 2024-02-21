namespace :data_migrations do
  desc "Migrate location data"
  task migrate_location_data: :environment do
    puts "Starting migration for #{Location::LOCATIONS.count} locations..."

    Location::LOCATIONS.each do |key, data|
      location = Location.new(slug: key, name: data[0], latitude: data[1], longitude: data[2])
      if location.save
        puts "Successfully created location #{key}"
      else
        puts "Failed to create location #{key}: #{location.errors.full_messages.join(', ')}"
      end
    end
  end
end


# Rake::Task['data_migration:migrate_location_data'].invoke
# Chose not to do a Transaction

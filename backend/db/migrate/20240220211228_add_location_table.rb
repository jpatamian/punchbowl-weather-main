class AddLocationTable < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
#  define the fields as decimal types with a precision of 10 and a scale of 6, which is a common recommendation for storing geographic coordinates

# frozen_string_literal: true

class AddUniqueConstraintToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_index :user_favorites, %i[user_id location_id], unique: true
  end
end

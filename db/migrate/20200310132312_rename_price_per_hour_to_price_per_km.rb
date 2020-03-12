# frozen_string_literal: true

class RenamePricePerHourToPricePerKm < ActiveRecord::Migration[5.2]
  def change
    rename_column :pigeons, :price_per_hour, :price_per_km
  end
end

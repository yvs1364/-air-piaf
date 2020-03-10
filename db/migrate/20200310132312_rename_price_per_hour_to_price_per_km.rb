class RenamePricePerHourToPricePerKm < ActiveRecord::Migration[5.2]
  def change
    rename_column :price_per_hour, :price_per_km
  end
end
  end
end

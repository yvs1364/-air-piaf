class AddCoordinatesToPigeons < ActiveRecord::Migration[5.2]
  def change
    add_column :pigeons, :latitude, :float
    add_column :pigeons, :longitude, :float
    add_column :pigeons, :address, :string
  end
end

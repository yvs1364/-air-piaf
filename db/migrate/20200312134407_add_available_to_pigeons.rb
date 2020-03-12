class AddAvailableToPigeons < ActiveRecord::Migration[5.2]
  def change
    add_column :pigeons, :available, :boolean, default: true
  end
end

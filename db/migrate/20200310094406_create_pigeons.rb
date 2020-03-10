class CreatePigeons < ActiveRecord::Migration[5.2]
  def change
    create_table :pigeons do |t|
      t.string :name
      t.string :breed
      t.integer :km_per_hour
      t.integer :price_per_hour
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

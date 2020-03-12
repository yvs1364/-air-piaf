# frozen_string_literal: true

class CreateJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :journeys do |t|
      t.references :user, foreign_key: true
      t.references :pigeon, foreign_key: true
      t.string :arrival_address
      t.text :message
      t.integer :total_price
      t.date :arrival_date

      t.timestamps
    end
  end
end

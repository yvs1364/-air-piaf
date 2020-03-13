class AddArrivalDateToJourneys < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :arrival_date, :datetime
  end
end

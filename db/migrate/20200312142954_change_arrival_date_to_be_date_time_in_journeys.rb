class ChangeArrivalDateToBeDateTimeInJourneys < ActiveRecord::Migration[5.2]
  def change
    change_column :journeys, :arrival_date, :datetime
  end
end

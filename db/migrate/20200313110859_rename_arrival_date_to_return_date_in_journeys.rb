class RenameArrivalDateToReturnDateInJourneys < ActiveRecord::Migration[5.2]
      def change
        rename_column :journeys, :arrival_date, :return_date
      end
    end

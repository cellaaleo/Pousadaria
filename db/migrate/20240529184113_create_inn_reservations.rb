class CreateInnReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :inn_reservations do |t|
      t.string :name
      t.date :starting_date
      t.date :ending_date

      t.timestamps
    end
  end
end

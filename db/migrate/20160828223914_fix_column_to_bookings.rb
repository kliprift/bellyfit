class FixColumnToBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :date, :start_date
    add_column :bookings, :end_date, :datetime

  end
end

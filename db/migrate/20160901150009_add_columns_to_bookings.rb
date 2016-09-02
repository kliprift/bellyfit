class AddColumnsToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :facility_location_name, :string
  	add_column :bookings, :participant_id, :string, array: true, default: []
  end
end

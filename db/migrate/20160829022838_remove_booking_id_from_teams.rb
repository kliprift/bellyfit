class RemoveBookingIdFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :booking_id, :integer
  end
end

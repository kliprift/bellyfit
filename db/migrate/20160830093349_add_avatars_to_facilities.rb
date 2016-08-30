class AddAvatarsToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :avatars, :json
  end
end

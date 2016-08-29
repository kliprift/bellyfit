class AddColumnsToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :location_name, :string
    add_column :facilities, :price, :integer
    add_column :facilities, :ratings, :integer
  end
end

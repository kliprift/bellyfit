class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :location_name, :string
    add_column :users, :price, :integer
    add_column :users, :ratings, :integer
  end
end

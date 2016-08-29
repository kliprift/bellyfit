class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :description, :string
    add_column :users, :contact_detail, :string
    add_column :users, :location_description, :string
  end
end

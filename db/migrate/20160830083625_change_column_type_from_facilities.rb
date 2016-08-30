
class ChangeColumnTypeFromFacilities < ActiveRecord::Migration
  def change
  	remove_column :facilities, :type
  	add_column :facilities, :sport, :string
  end
end

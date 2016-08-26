class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :type
      t.string :timeslot
      t.string :description

      t.timestamps null: false
    end
  end
end

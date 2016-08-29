class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :type
      t.time :start_time
      t.time :end_time
      t.string :description
      t.string :location_name
      t.integer :ratings
      t.integer :price_per_hour
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end




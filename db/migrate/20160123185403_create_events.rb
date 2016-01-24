class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :address
      t.string :venue_name
      t.string :event_time
      t.float :latitude
      t.float :longitude
      t.string :locality
      t.string :venue_desc

      t.timestamps null: false
    end
  end
end

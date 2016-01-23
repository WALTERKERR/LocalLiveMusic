class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :address
      t.string :venue_name
      t.datetime :event_time

      t.timestamps null: false
    end
  end
end

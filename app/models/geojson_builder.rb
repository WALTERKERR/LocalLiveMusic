class GeojsonBuilder < ActiveRecord::Base
  # app/models/geojson_builder.rb
  def build_event(event, geojson)
    geojson << {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [event.longitude, event.latitude] # this part is tricky
      },
      properties: {
        event_name: event.event_name,
        address: event.address,
        :"marker-color" => "#FFFFFF",
        :"marker-symbol" => "circle",
        :"marker-size" => "medium",
      }
    }
  end
end
      # t.string :event_name
      # t.string :address
      # t.string :venue_name
      # t.datetime :event_time

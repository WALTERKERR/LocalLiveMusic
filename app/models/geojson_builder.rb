class GeojsonBuilder < ActiveRecord::Base
  # app/models/geojson_builder.rb
  def self.build_event(event, geojson)
    geojson << {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [event.longitude, event.latitude]
      },
      properties: {
        event_name: event.event_name,
        address: event.address,
        :"marker-color" => "  #FF0000",
        :"marker-symbol" => "circle",
        :"marker-size" => "large",
      }
    }
  end
end


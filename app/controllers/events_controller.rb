class EventsController < ApplicationController
  def index
   #all event objects
    @events = Event.all
    # and empty array
    @geojson = Array.new
    #calls the below method that calls all event objects and an empty array
    build_geojson(@events, @geojson)
  end

  respond_to do |format|
    format.html
    format.json { render json: @geojson }
  end

  def build_geojson(events, geojson)
    events.each do |event|
      geojson << GeojsonBuilder.build_event(event)
    end
  end

end

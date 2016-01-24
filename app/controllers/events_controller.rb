class EventsController < ApplicationController
  def index
   #all event objects
    @events = Event.all
    # and empty array
    @geojson = Array.new
    #calls the below method that calls all event objects and an empty array
    build_geojson(@events, @geojson)
    gon.events = Event.all
  end

  respond_to do |format|
    format.html
    format.json { render json: @geojson }
  end

  def build_geojson(events, geojson)
    events.each do |event|
      GeojsonBuilder.build_event(event, geojson)
    end
  end
end

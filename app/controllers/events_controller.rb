class EventsController < ApplicationController
  def index
    @events = Event.all
    # respond_to do |format|
    #   format.html
    #   format.json { render json: # some JSON data }
    # end
  end

end

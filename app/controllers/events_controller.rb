class EventsController < ApplicationController
  def index
    gon.events = Event.all
  end

end

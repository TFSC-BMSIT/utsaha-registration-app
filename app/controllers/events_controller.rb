class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end
end

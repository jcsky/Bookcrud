class EventsController < ApplicationController
before_action :dofirst, :only => [ :update, :show, :edit, :destroy]
  def index
    @events=Event.all
  end

  def new
    @event=Event.new
  end

  def create
    @event=Event.new( event_params )
    @event.save

    redirect_to events_url
  end

  def show
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to events_url
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :isbn, :description)
  end

  def dofirst
    @event=Event.find(params[:id])
  end
end

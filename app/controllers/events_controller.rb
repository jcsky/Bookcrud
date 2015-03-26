class EventsController < ApplicationController
before_action :dofirst, :only => [ :update, :show, :edit, :destroy]
  def index
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event=Event.new
  end

  def create
    @event=Event.new( event_params )
    if @event.save
      flash[:n] = "新增成功"
      redirect_to events_url
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:n] = "修改成功"
      redirect_to events_url
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy
    flash[:alert] = "刪除成功"
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

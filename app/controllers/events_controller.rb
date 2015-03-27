class EventsController < ApplicationController
before_action :dofirst, :only => [ :update, :edit, :destroy]
  def index
    @events = Event.page(params[:page]).per(5)
    @e_new = Event.new
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
    index
    @e_show=Event.find(params[:id])
    render :action => :index
  end

  def edit
    index
    render :action => :index
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
    params.require(:event).permit(:name, :isbn, :description, :soldtime, :builddate)
  end

  def dofirst
    @event=Event.find(params[:id])
  end
end

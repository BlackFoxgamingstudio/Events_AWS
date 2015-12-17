class EventsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @events_home = Event.where(state: @user[:state])
    @events_away = Event.where.not(state: @user[:state])
  end

  def create
    event = Event.new( event_params )
    if event.valid?
      event.save
      redirect_to "/events"
    else
      flash[:errors] = event.errors.full_messages
      redirect_to "/events"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def event_params
      params.require(:event).permit(:title, :date, :location, :state, :user_id)
    end
end

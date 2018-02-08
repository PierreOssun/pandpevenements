class EventsController < ApplicationController

  def index
    @event = Event.all
    @user = current_user
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.new(event_params)
    if @event.save
      flash.now[:success] = "Votre evenement a ete ajoute"
      redirect_to events_path
      @event.attendees << current_user
      @event.save
    else
      render 'new'
      flash.now[:error] = "L'événement n'a pas été créé"
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
  end

  private
      def event_params
        params.require(:event).permit(:description, :date, :place)
      end
end

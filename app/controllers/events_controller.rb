class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /dmeets or /dmeets.json
   

  def index
    @upcoming_events = Event.upcoming.order("event_date")
    @past_events = Event.past.order("event_date DESC")
    @event = Event.new
  end

  # GET /dmeets/1 or /dmeets/1.json
  def show
    @event = Event.find(params[:id])
  end

  def add_attendee
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.attendees.include?(current_user)
        format.html { redirect_to event_path(@event), notice: 'you are already attending this event.'}
      else
        @guests = GuestList.new
        @guests.user_id = current_user.id
        @guests.event_id = @event.id
        @guests.save
        format.html { redirect_to event_path(@event), notice: 'you are now attending this event.' }
      end  
    end  
  end

  # GET /dmeets/new
  def new
    @event = current_user.events.build
  end

  # GET /dmeets/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /dmeets or /dmeets.json
  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dmeets/1 or /dmeets/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmeets/1 or /dmeets/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "event was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :location, :description, :event_date)
    end
end

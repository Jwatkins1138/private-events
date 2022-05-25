class GuestListsController < ApplicationController

  # before_action :authenticate_user!
  before_filter :find_user
  before_filter :find_event

  def new
    @guest_list = GuestList.new(guest_list_params)
  end

  def create
    @guest_list = GuestList.new(:user_id => @user.id, :event_id => @event.id)
    @guest_list.save
    redirect_to root_path
    

    # respond_to do |format|
    #   if @guest_list.save
    #     format.html { redirect_to event_path, notice: "attending event." }
    #     format.json { render :show, status: :created, location: @guest_list }
      # else
      #   format.html { render event:show, status: :unprocessable_entity }
      #   format.json { render json: @guest_list.errors, status: :unprocessable_entity }
      # end
    # end
  end

  private

  def find_user
    @user = current_user
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def guest_list_params
    params.require(:guest_list).permit(:user_id, :event_id) if params[:guest_list].present?
  end

end

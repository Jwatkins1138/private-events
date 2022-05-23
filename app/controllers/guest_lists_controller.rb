class GuestListsController < ApplicationController
  def new
    @guest_list = GuestList.new
  end

  def create(event_id, user_id)
    @guest_list = GuestList.new
    @guest_list.user_id = user_id
    @guest_list.event_id = event_id
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

end

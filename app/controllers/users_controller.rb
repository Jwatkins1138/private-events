class UsersController < ApplicationController

  def show
    @upcoming_events = Event.upcoming.order("event_date")
    @past_events = Event.past.order("event_date")
  end
end

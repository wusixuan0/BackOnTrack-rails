class Api::EventsController < ApplicationController

  def create
    @event = Event.new(event_params)

  end

  private
  def event_params
    params.require(:user).permit(
      :userid,
      :title,
      :description,
      :start,
      :end,
      :allday?
    )
  end
end

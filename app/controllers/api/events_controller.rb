class Api::EventsController < ApplicationController
  def index
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: {
        status: 200,
        message: "Successfully created event",
      }.to_json
    else
      render json: {
        status: 500,
        message: "Fail to create event",
      }.to_json
    end
  end

  def update
    @event.find(params[:eventid]).update({start: params[:start], end: params[:end]})
  end

  def destroy
    @event.find(params[:eventid]).destroy
  end

  private
  def event_params
    params.require(:event).permit(
      :userid,
      :title,
      :description,
      :start,
      :end,
      :allday?
    )
  end

end

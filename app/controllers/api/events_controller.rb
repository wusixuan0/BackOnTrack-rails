class Api::EventsController < ApplicationController
  def index

    if params[:role] === 'doctor'
      @events = Event.where(doctor_id: params[:id]).as_json
      render json: {events: @events}, status: :ok
    else
      @events = Event.where(client_id: params[:id]).as_json
      render json: {events: @events}, status: :ok
    end
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: {message: "Successfully created event"}, status: :ok

    else
      render json: {
        status: 500,
        message: "Fail to create event",
      }.to_json
    end
  end

  def update
    @event = Event.find(update_event_params[:id])
    if (@event)
      @event.update(update_event_params)
      render json: {message: "Successfully updated event"}, status: :ok
    else
      render json: {message: "Fail to update event"}, status: :ok
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event
      @event.destroy
      render json: {message: "Successfully deleted event"}, status: :ok
    else
      render json: {message: "Fail to delete event"}, status: :ok
    end
  end

  private
  def event_params
    params.require(:event).permit(
      :doctor_id,
      :client_id,
      :title,
      :description,
      :start,
      :end,
      :allday
    )
  end
  def index_params
    params.permit(:id, :role)
  end
  def update_event_params
    params.require(:event).permit(
      :id,
      :title,
      :description,
      :start,
      :end,
      :allday,
      :doctor_id,
      :client_id
    )
  end

end

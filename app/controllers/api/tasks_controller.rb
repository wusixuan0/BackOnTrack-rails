class Api::TasksController < ApplicationController
  def index
    if params[:role] === 'client'
      reminders = Reminder.where(client_id: params[:id]).as_json
    else
      reminders = Reminder.where(doctor_id: params[:id]).as_json
    end
    render json: {reminders: reminders}, status: :ok
  end

  def create
    @reminder = Reminder.new(task_params)
    if @reminder.save
      reminders = Reminder.where(doctor_id: params[:doctor_id], client_id: params[:client_id]).as_json
      render json: {reminders: reminders}, status: :ok
    else
      render json: {
        status: 500,
        message: "Input field cannot be empty",
      }.to_json
    end
  end

  def destroy
    Reminder.find(params[:id]).destroy
    reminders = Reminder.where(doctor_id: params[:doctor_id], client_id: params[:client_id]).as_json
    render json: {reminders: reminders}, status: :ok
  end

  private
  def index_params
    params.permit(:id, :role)
  end
  def task_params
    params.permit(:doctor_id, :client_id, :title, :content)
  end
  def id_params
    params.permit(:id, :doctor_id, :client_id)
  end
end

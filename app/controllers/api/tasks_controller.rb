class Api::TasksController < ApplicationController
  def index
    if params[:role] === 'client'
      list_doctor_userid = params[:ids]
      list_doctor_id = Doctor.where(user_id: params[:ids]).pluck(:id)
      reminders = Reminder.where(doctor_id: list_doctor_id).as_json
    else
      list_client_userid = params[:ids]
      list_client_id = Client.where(user_id: params[:ids]).pluck(:id)
      reminders = Reminder.where(client_id: list_client_id).as_json
    end
    render json: {reminders: reminders}, status: :ok
  end

  def create
    doctor_id = Doctor.find_by_userid(params[:doctor_user_id]).id
    client_id = Client.find_by_userid(params[:client_user_id]).id
    Reminder.create! ({
      doctor_id: doctor_id,
      client_id: client_id,
      title: params[:title],
      content: params[:content]
    })
    reminders = Reminder.where(doctor_id: doctor_id, client_id: client_id).order(:id).as_json
    render json: {reminders: reminders}, status: :ok
  end
  def destroy
    Reminder.find(params[:id]).destroy
    reminders = Reminder.where(doctor_id: doctor_id, client_id: client_id).order(:id).as_json
    render json: {reminders: reminders}, status: :ok
  end
  private
  def index_params
    params.permit(:ids, :role)
  end
  def task_params
    params.permit(:doctor_user_id, :client_user_id, :title, :content)
  end
  def id_params
    params.permit(:id, :doctor_user_id, :client_user_id)
  end
end

class Api::SessionsController < ApplicationController
  def self.generate_jwt(payload)
    super(payload)
  end
  def self.decode_jwt(jwt)
    super(jwt)
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # admin ||= user.role === 'doctor' ? true : false
      if user.role === 'doctor'
        relation_ids = Client.where("doctor_id = #{user.id}").pluck(:user_id)
        relation = User.where(id: relation_ids).select(:id, :first_name, :last_name, :email).as_json
      else
        if Client.find_by_user_id(user.id).doctor_id
          relation_ids = Doctor.find(Client.find_by_user_id(user.id).doctor_id).user_id
          relation = User.where(id: relation_ids).select(:id, :first_name, :last_name, :email).as_json
        else #if client does not have any doctor
          relation = [];
        end
      end
      payload = {
        user_id: user.id,
        role: user.role,
        first_name: user.first_name,
        last_name: user.last_name,
        relation: relation
      }
      token = self.class.generate_jwt(payload)
      render json: {token: token}, status: :ok
    else
      render json: {token: false}, status: 500
    end
  end
  def update
    if Client.find_by_user_id(params[:id]).doctor_id
      relation_ids = Doctor.find(Client.find_by_user_id(params[:id]).doctor_id).user_id
      relation = User.where(id: relation_ids).select(:id, :first_name, :last_name, :email).as_json
    else #if client does not have any doctor
      relation = [];
    end
    render json: {updated_relation: relation}, status: :ok
  end
  private
  def id_params
    params.permit(:id)
  end
end

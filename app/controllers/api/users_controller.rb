class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.role == "client"
        Client.create({user_id: @user.id})
      else
        Doctor.create({user_id: @user.id})
      end
      render json: {
        status: 200,
        message: "Successfully created user",
      }.to_json
    else
      render json: {
        status: 500,
        message: "Fail to create user",
      }.to_json
    end
  end

  def update
    doctor_user_id = params[:userid]
    doctor_id = Doctor.find_by_user_id(doctor_user_id).id
    client_user_id = User.find_by_email(params[:add_client_email]).id
    client_id = Client.find_by_user_id(client_user_id).id
    Relation.create({doctor_id: doctor_id, client_id: client_id})
    # Client.find_by_user_id(client_user_id).update(doctor_id: doctor_user_id)
    # @updated_relation = User.where(id: Client.where("doctor_id = #{doctor_user_id}")
    #   .pluck(:user_id)).select(:id, :first_name, :last_name)
    list_client_id = Relation.where(doctor_id: doctor_id).pluck(:client_id)
    list_client_userid = Client.where(id: list_client_id).pluck(:user_id)
    @updated_relation = User.where(id: list_client_userid).select(:id, :first_name, :last_name, :email, :role).as_json
    render json: {updated_relation: @updated_relation}, status: :ok
  end


  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :role
    )
  end
  def add_params
    params.permit(
      :userid,
      :add_client_email
    )
  end

end

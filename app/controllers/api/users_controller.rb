class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.role == "doctor"
        Doctor.create({user_id: @user.id})
      else
        Client.create({user_id: @user.id})
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
    client_user_id = User.find_by_email(params[:add_client_email]).id
    Client.find_by_user_id(client_user_id).update(doctor_id: doctor_user_id)
    puts Client.find_by_user_id(client_user_id).inspect
    puts params[:userid]
    @updated_relation = User.where(id: Client.where("doctor_id = #{doctor_user_id}").pluck(:user_id)).select(:id, :first_name, :last_name)
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

end

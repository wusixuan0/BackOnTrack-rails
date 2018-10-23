class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end
  def create
    @user = User.new(user_params)

    if @user.save
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

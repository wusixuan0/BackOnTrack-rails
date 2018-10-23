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

      payload = {
        user_id: user.id,
        role: user.role,
        first_name: user.first_name
      }
      token = self.class.generate_jwt(payload)
      render json: {token: token}, status: :ok
    else

      render json: {token: false}, status: 500
    end
  end
end

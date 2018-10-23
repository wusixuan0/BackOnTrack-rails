class ApplicationController < ActionController::API
  before_action :ensure_json_request  # ensure all requests are JSON
  respond_to :json #api will be responding to JSON format

  private
  def ensure_json_request
    return if request.format == :json
    render :nothing => true, :status => 406
  end

  def self.generate_jwt (payload)
    hmac_secret = ENV["JWT_HMAC_SECRET_KEY"]
    token = JWT.encode payload, hmac_secret, 'HS256'
  end

  def self.decode_jwt (jwt)
    puts jwt
    hmac_secret = ENV['JWT_HMAC_SECRET_KEY']
    decoded_token = JWT.decode jwt, hmac_secret, true, { algorithm: 'HS256' }
  end
end

class ApplicationController < ActionController::API
  before_action :ensure_json_request  # ensure all requests are JSON
  respond_to :json #api will be responding to JSON format

  private
  def ensure_json_request
    return if request.format == :json
    render :nothing => true, :status => 406
  end
end

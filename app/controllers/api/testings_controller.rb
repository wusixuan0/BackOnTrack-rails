class Api::TestingsController < ApplicationController
  def index
    @message = Testing.first
    # respond_with @message
    render :json => @message
  end

end

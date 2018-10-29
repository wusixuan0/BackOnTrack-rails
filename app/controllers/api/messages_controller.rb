class Api::MessagesController < ApplicationController
  def index
    messages = Message.where(recipient_id: params[:id]).as_json
    render json: {messages: messages}, status: :ok
  end
  def create
    Message.create!(message_params)
    render json: {
        status: 200,
      }.to_json
  end
  def destroy
  end
  private
  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :sender_name, :content)
  end
  def id_params
    params.permit(:id)
  end
end

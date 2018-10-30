class Api::TasksController < ApplicationController
  def index
    task_list = TodoList.where(user_id: params[:ids]).as_json
    render json: {tasks: task_list}, status: :ok
  end

  def create
    TodoList.create!(task_params)
    task_list = TodoList.where(user_id: task_params[:user_id]).as_json
    render json: {tasks: task_list}, status: :ok
  end
  def destroy
    TodoList.find(params[:id]).destroy
    task_list = TodoList.where(user_id: params[:user_id]).as_json
    render json: {tasks: task_list}, status: :ok
  end
  private
  def ids_params
    params.permit(:ids)
  end
  def task_params
    params.require(:newtask).permit(:user_id, :title, :content)
  end
  def id_params
    params.permit(:id, :user_id)
  end
end

class Api::TasksController < ApplicationController
  def index
    task_list = TodoList.where(user_id: params[:ids]).as_json
    render json: {tasks: task_list}, status: :ok
  end

  def create
    User.find(params[:id]).todo_lists.create(title: "a", content: "b")

  end
  def destroy
  end
  private
  def ids_params
    params.permit(:ids)
  end
  def id_params
    params.permit(:id)
  end
end

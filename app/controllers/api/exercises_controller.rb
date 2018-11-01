class Api::ExercisesController < ApplicationController
  def index
    exercises = Exercise.where(user_id: params[:id]).as_json
    render json: {exercises: exercises}, status: :ok
  end

  def create
    Exercise.create!(exercise_params)
    user_id = exercise_params[:user_id]
    exercises = Exercise.where(user_id: user_id).as_json
    render json: {exercises: exercises}, status: :ok
  end

  def update
  end

  def destroy
  end

  private
  def exercise_params
    params.require(:exercise).permit(:user_id, :name, :calories, :duration)
  end
  def id_params
    params.permit(:id)
  end
end

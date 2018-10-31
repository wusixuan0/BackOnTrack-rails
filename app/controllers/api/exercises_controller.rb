class Api::ExercisesController < ApplicationController
  def index
    puts '>>>>>>>>>>>'
    puts params[id]


    exercises = Exercise.where(user_id: params[id]).as_json
    render json: {exercises: exercises}, status: :ok
  end

  def create
    puts params[:exercise]
    params[:exercise].map {|exercise| puts exercise }
    params[:exercise].map {|exercise| Exercise.create!(exercise)}
    user_id = params[:newexercise][0].user_id
    foods = Exercise.where(user_id: user_id).as_json
    render json: {exercises: exercises}, status: :ok
  end

  def update
  end

  def destroy
  end

  private
  def nutrition_params
    params.permit(:exercise, :id)
  end
  # def id_params
  #   params.permit(:id)
  # end
end

class Api::NutritionsController < ApplicationController
  def index
    puts '>>>>>>>>>>>'
    puts params[id]


    foods = Nutrition.where(user_id: params[id]).as_json
    render json: {foods: foods}, status: :ok
  end

  def create
    params[:newfood].map {|food| Nutrition.create!(food)}
    user_id = params[:newfood][0].user_id
    foods = Nutrition.where(user_id: user_id).as_json
    render json: {foods: foods}, status: :ok
  end

  def update
  end

  def destroy
  end

  private
  def nutrition_params
    params.permit(:newfood)
  end
  def index_params
    params.permit(:id)
  end
end


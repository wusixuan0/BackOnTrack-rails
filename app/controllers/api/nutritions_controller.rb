class Api::NutritionsController < ApplicationController
  def index
    foods = Nutrition.where(user_id: params[:id]).as_json
    render json: {foods: foods}, status: :ok
  end

  def create
    Nutrition.create!(nutrition_params)
    user_id = nutrition_params[:user_id]
    exercises = Nutrition.where(user_id: user_id).as_json
    render json: {foods: exercises}, status: :ok
  end

  def update
  end

  def destroy
  end

  private
  def nutrition_params
    params.require(:nutritions).permit(:user_id, :name, :quantity,
      :serving_size, :calories, :carbohydrates,
      :protein, :fat)
  end

  # def nutrition_params
  #   params.require(:nutritions).map do |f|
  #     ActionController::Parameters.new(f).permit(
  #       :name,
  #       :quantity,
  #       :serving_size,
  #       :calories,
  #       :carbohydrates, :protein, :fat
  #     )
  #   end
  # end

  def index_params
    params.permit(:id)
  end
end


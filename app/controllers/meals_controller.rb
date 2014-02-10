class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.create(params[:meal])
    ingredients = params[:ingredients]
    servings = params[:servings]
    ingredients.each_with_index do |ingredient, index|
      IngredientMeal.create(meal_id: @meal.id, ingredient_id: ingredient, servings: servings[index])
    end
  end

  def show
  end
end
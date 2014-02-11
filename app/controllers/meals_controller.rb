class MealsController < ApplicationController
  
  def index
    @meals = Meal.all
  end
  
  def new
    @meal = Meal.new
  end

  def create
    @meal = current_user.meals.create(params[:meal])
    if @meal.save
      ingredients = params[:ingredients]
      servings = params[:servings]
      ingredients.each_with_index do |ingredient, index|
        IngredientMeal.create(meal_id: @meal.id, ingredient_id: ingredient, servings: servings[index])
      end
      redirect_to meal_path(@meal)
    else
      flash[:error] = @meal.errors.empty? ? "Error" : @meal.errors.full_messages.to_sentence
      redirect_to new_meal_path
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end
  
  def eat
    @meal = Meal.find(params[:meal_id])
    current_user.eat(@meal)
    redirect_to root_path, flash: {success: "Meal eaten. Yum yum yum."}
  end
end
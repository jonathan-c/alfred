class MealsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_user.meals.create(params[:meal])
    if @meal.save
      ingredients = params[:ingredient_ids]
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

  def edit
    @meal = Meal.find(params[:id])
    @ingredients = @meal.ingredients
  end

  def update
    @meal = Meal.find(params[:id])
    ingredients = []
    params[:ingredients].each do |i|
      ingredients<<Ingredient.find_by_name(i).id
    end
    if @meal.update_attributes(params[:meal])
    # There's gotta be a better way to do this.
      IngredientMeal.delete_all("meal_id = #{@meal.id}")
      servings = params[:servings]
      ingredients.each_with_index do |ingredient, index|
        IngredientMeal.create(meal_id: @meal.id, ingredient_id: ingredient, servings: servings[index])
      end
      redirect_to meal_path(@meal), flash: {success: "Meal updated."}
    else
      redirect_to edit_meal_path(@meal)
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to ingredients_path, flash: {success: "Successfully deleted meal."}
  end

  def eat
    @meal = Meal.find(params[:meal_id])
    current_user.eat(@meal)
    redirect_to root_path, flash: {success: "Meal eaten. Yum yum yum."}
  end

  def remove_meal
    @meal = Meal.find(params[:meal_id])
    current_user.remove_meal(@meal)
    redirect_to root_path, flash: {success: "Meal removed."}
  end
end

class CategoriesController < ApplicationController
  def index
    @meals = Meal.all
    @categories = Category.all
  end
end

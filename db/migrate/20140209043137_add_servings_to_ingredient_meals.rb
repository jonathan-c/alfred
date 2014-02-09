class AddServingsToIngredientMeals < ActiveRecord::Migration
  def change
    add_column :ingredient_meals, :servings, :float
  end
end

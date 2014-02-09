class CreateIngredientMeals < ActiveRecord::Migration
  def change
    create_table :ingredient_meals, :id => false do |t|
      t.integer :meal_id
      t.integer :ingredient_id

      t.timestamps
    end
    add_index :ingredient_meals, :meal_id
    add_index :ingredient_meals, :ingredient_id
  end
end

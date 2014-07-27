class RemoveCostAndServingsFieldFromMeals < ActiveRecord::Migration
  def up
    remove_column :ingredients, :servings
    remove_column :ingredients, :price
  end

  def down
    add_column :ingredients, :servings, :float
    add_column :ingredients, :price, :decimal
  end
end

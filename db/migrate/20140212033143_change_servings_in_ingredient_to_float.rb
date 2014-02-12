class ChangeServingsInIngredientToFloat < ActiveRecord::Migration
  def up
    change_column :ingredients, :servings, :float
  end

  def down
    change_column :ingredients, :servings, :integer
  end
end

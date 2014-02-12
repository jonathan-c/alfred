class ChangeDefaultValueForIngredientPrice < ActiveRecord::Migration
  def up
    change_column :ingredients, :price, :decimal, :precision => 5, :scale => 2, :default => 0
  end

  def down
    change_column :ingredients, :price, :decimal, :precision => 5, :scale => 2
  end 
end

class AddUnitToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :unit, :string, :default => "oz"
  end
end

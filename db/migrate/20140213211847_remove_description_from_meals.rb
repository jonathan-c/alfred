class RemoveDescriptionFromMeals < ActiveRecord::Migration
  def up
    remove_column :ingredients, :description
  end

  def down
    add_column :ingredients, :description, :string
  end
end

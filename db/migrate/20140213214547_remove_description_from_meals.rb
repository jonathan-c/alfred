class RemoveDescriptionFromMeals < ActiveRecord::Migration
  def up
    remove_column :meals, :description
  end

  def down
    add_column :meals, :description, :string
  end
end

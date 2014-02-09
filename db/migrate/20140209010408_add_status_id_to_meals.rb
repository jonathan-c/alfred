class AddStatusIdToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :status_id, :integer
  end
end

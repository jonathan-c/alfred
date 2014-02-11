class CreateMealStatuses < ActiveRecord::Migration
  def change
    create_table :meal_statuses do |t|
      t.integer :meal_id
      t.integer :status_id

      t.timestamps
    end
  end
end

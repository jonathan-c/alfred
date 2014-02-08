class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :remaining_calories
      t.integer :remaining_protein
      t.integer :remaining_carbs
      t.integer :weight

      t.timestamps
    end
  end
end

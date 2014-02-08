class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.integer :prep_time
      t.string :clean_up
      t.boolean :homemade

      t.timestamps
    end
  end
end

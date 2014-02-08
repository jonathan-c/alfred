class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :serving_size
      t.integer :servings

      t.timestamps
    end
  end
end

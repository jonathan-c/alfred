class AddCategories < ActiveRecord::Migration
  def up
    Category.create(name: "breakfast")
    Category.create(name: "snack")
    Category.create(name: "lunch")
    Category.create(name: "dinner")
  end

  def down
    Category.destroy_all
  end
end

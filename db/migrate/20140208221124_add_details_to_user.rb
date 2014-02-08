class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :weight, :integer
    add_column :users, :feet, :integer
    add_column :users, :inches, :integer
    add_column :users, :name, :string
  end
end

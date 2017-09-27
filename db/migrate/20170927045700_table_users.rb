class TableUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table :users 
  	add_column :users, :name, :string
  	add_column :users, :password, :string
  	add_column :users, :role, :string
  end
end

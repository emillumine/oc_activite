class TableComments < ActiveRecord::Migration[5.1]
  def change
  	create_table :comments 
  	add_column :comments, :advertisement_id, :integer
  	add_column :comments, :user_id, :integer
  	add_column :comments, :content, :text

  	add_index :comments, :advertisement_id
  	add_index :comments, :user_id
  end
end

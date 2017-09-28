class TableAdvertisements < ActiveRecord::Migration[5.1]
  def change
  	create_table :advertisements 
  	add_column :advertisements, :title, :string
  	add_column :advertisements, :content, :text
  	add_column :advertisements, :price, :integer
  	add_column :advertisements, :state, :string
  	add_column :advertisements, :user_id, :integer
  	add_index :advertisements, :user_id
  end
end

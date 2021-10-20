class DropJoinTableOrderProducts < ActiveRecord::Migration[6.1]
  def change
    drop_join_table :orders, :products 
  end
  
end

class AddColumnsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :productable_id, :string
    add_column :products, :productable_type, :string
  end
end

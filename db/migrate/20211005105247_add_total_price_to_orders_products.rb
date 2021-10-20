class AddTotalPriceToOrdersProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :orders_products, :total_price, :float
  end
end

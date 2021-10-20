class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :product_price
      t.string :product_brand
      t.integer :product_size
      t.integer :product_in_strock
      t.text :product_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

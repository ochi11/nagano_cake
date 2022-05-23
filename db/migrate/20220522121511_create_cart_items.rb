class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.timestamps

      #上から商品ID、会員ID、数量
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.integer :amount, null: false
    end
  end
end

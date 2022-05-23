class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps

      #上から商品ID、注文ID
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      #上から購入時価格（税込）、数量、製作ステータス
      t.integer :purchase_price, null: false
      t.integer :amount, null: false
      t.integer :production_status, null: false, default: 0
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.timestamps

      t.integer :customer_id, null: false
      t.string :order_postal_code, null: false
      t.string :order_address, null: false
      t.string :order_name, null: false

      t.integer :postage, null: false
      t.integer :billing_amount, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0
    end
  end
end

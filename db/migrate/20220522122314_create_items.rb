class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps

      #上からジャンルID、商品名、商品説明文
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false

      #上から税抜き価格、販売ステータス
      t.integer :price, null: false
      t.integer :is_active, null: false, default: true
    end
  end
end

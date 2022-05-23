class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.timestamps

      #ジャンル名
      t.string :name, null: false
    end
  end
end

class Item < ApplicationRecord
	# ジャンルとの紐付け
	belongs_to :genre

	has_many :order_details, dependent: :destroy
	has_many :cart_items, dependent: :destroy

    has_one_attached :image

    def add_tax_price
      (price * 1.1).floor
    end


end

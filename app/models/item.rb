class Item < ApplicationRecord
	# ジャンルとの紐付け
	belongs_to :genre

	has_many :order_details, dependent: :destroy

    has_one_attached :image

    def add_tax_price
      (self.price * 1.1).round
    end
end

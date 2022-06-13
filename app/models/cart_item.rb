class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

    def add_tax_price
      (price * 1.1).floor
    end

  def subtotal
    item.add_tax_price * amount
  end

  def total_price
		line_items.to_a.sum { |item| item.total_price }
  end
end

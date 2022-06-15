class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy

  belongs_to :home
  belongs_to :customer

    def add_tax_price
      (price * 1.1).floor
    end

  enum payment_method: { credit_card: 0, transfer: 1 }


end

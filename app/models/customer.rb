class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #配送先との紐付け
  has_many :addresses, dependent: :destroy
  #カートの商品との紐付け
  has_many :cart_items, dependent: :destroy
  #注文履歴との紐付け
  has_many :orders, dependent: :destroy
end

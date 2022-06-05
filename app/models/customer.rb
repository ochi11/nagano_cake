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

  #validation
  #validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  #validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  #validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。'}
  #validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。'}

  #VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
  #validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }

  #VALID_TELEPHONE_NUMBER_REGEX = /\A\d{10}\z/
  #validates :telephone_number, presence: true, format: { with: VALID_TELEPHONE_NUMBER_REGEX }

  #validates :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number, :email, presence: true
end

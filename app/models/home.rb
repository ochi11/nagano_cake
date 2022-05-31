class Home < ApplicationRecord
  #注文詳細との紐付け
	has_many :order_details, dependent: :destroy
	has_many :orders, through: :order_details
	accepts_nested_attributes_for :order_details
	# 顧客との紐付け
	belongs_to :customer

	has_one_attached :image

	scope :created_today, -> { where(created_at: Time.zone.now.all_day) }

	#enum_支払い方法
	enum payment_method: {クレジットカード:1, 銀行振込:2}

	#注文ステータス
	enum status: {入金待ち:0, 入金確認:1 ,製作中:2, 発送準備中:3, 発送済み:4}
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  belongs_to :user
  has_one_attached :image
  has_one :purchase, dependent: :destroy

  # 画像・商品名・説明・価格バリデーション
  validates :image, :name, :description, :price, presence: true

  # 価格バリデーション
  validates :price, numericality: {
    only_integer: true, # 半角数値のみ
    greater_than_or_equal_to: 300, # 最小値
    less_than_or_equal_to: 9_999_999 # 最大値
  }

  # アクティブハッシュバリデーション
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_days_id,
            numericality: { other_than: 1, message: "can't be blank" }
end

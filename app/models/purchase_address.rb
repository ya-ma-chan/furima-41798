class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  #バリデーション
  with_options presence: true do
    # 郵便番号
    POSTAL_CODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    # アクティブハッシュ
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    # ユーザーID・商品ID・市区町村・番地
    validates :user_id, :item_id ,:city, :address, :token
      # 電話番号
    validates :phone_number,
              length: { minimum: 10, message: 'is too short' },
              format: { with: /\A\d+\z/, message: 'is invalid. Input only number' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
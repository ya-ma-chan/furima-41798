FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name } # 商品名
    description { Faker::Lorem.sentence } # 商品説明
    price { Faker::Number.between(from: 300, to: 9_999_999) } # 価格
    category_id { Faker::Number.between(from: 2, to: 11) } # カテゴリー (2以上)
    condition_id { Faker::Number.between(from: 2, to: 7) } # 商品の状態 (2以上)
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) } # 配送料の負担 (2以上)
    prefecture_id { Faker::Number.between(from: 2, to: 48) } # 発送元の地域 (2以上)
    shipping_days_id { Faker::Number.between(from: 2, to: 4) } # 発送までの日数 (2以上)
    association :user # Userモデルとの関連付け

    after(:build) do |item|
      # ActiveStorageの画像添付
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

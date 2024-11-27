FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { Faker::Number.number(digits: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

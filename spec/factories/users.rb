FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password do
      length = rand(6..32)
      Faker::Alphanumeric.alphanumeric(number: length, min_alpha: 1, min_numeric: 1)
    end
    password_confirmation { password }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birth_date { Faker::Date.between(from: Date.new(1930), to: Date.new(Time.now.year - 5)) }
  end
end

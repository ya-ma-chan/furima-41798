class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 基本的な必須項目
  validates :nickname, :birth_date, presence: true

  # パスワードバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }

  # 名前の全角文字バリデーション
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  with_options presence: true, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  # カタカナのバリデーション
  KATAKANA_REGEX = /\A[ァ-ヶー]+\z/
  with_options presence: true, format: { with: KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end

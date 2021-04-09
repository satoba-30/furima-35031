class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)\w{6,}\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

    validates :last_name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/,
                        message: ' Full-width katakana characters' }

    validates :first_name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/,
                        message: ' Full-width katakana characters' }
    validates :birthday
  end
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: ' include both letters and numbers'

  has_many :items
end

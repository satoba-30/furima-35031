class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/i.freeze
         
  validates :nickname,presence: true
  
  validates_format_of :password, with: VALID_PASSWORD_REGEX,message: "Password Include both letters and numbers" 

  validates :last_name,presence: true,
            format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
            message: "Last name can't be blank" }

  validates :first_name,presence: true,
            format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
            message: "First name can't be blank"}

  validates :last_name_kana,presence: true,
            format: {with: /\A[ァ-ヶー－]+\z/,
            message: "Last name kana Full-width katakana characters" }

  validates :first_name_kana,presence: true,
            format: {with: /\A[ァ-ヶー－]+\z/,
            message: "First name kana Full-width katakana characters"}
            
  validates :birthday,presence: true
            # format: {message: "Birth date can't be blank"}
end

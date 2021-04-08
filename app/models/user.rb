class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/i.freeze
         
  validates :nickname,presence: true
  
  validates_format_of :password, with: VALID_PASSWORD_REGEX,message: " include both letters and numbers" 

  validates :last_name,presence: true,
            format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
            

  validates :first_name,presence: true,
            format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}

  validates :last_name_kana,presence: true,
            format: {with: /\A[ァ-ヶー－]+\z/,
            message: " Full-width katakana characters" }

  validates :first_name_kana,presence: true,
            format: {with: /\A[ァ-ヶー－]+\z/,
            message: " Full-width katakana characters"}
            
  validates :birthday,presence: true
end

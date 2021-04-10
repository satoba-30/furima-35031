class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one :status
  has_one :delivery_fee
  belongs_to :post_address
  belongs_to :post_daytime

  
  validates :price, numericality: {greater_than: 300,less_than: 9999999}
  
  with_options presence: true do
    validates :name, {max_length: 40}
    validates :text, {max_length: 1000}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :post_address_id
      validates :post_daytime_id
    end
  end
end

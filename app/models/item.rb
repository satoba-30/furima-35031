class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one :status
  has_one :delivery_fee
  belongs_to :post_address
  belongs_to :post_daytime

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than: 299, less_than: 10_000_000 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :post_address_id
      validates :post_daytime_id
    end
  end
end

class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  
  with_options presence: true do
    validates :name
    validates :price,format: {with: /\A[0-9]+\z/ }
    validates :category_id
    validates :text
    validates :status_id
    validates :delivery_fee_id
    validates :post_address_id
    validates :post_daytime_id 
  end
end

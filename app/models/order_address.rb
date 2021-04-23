class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_num, :post_address_id, :city, :address, :build, :telephone_num, :user_id, :item_id

  with_options presence: true do
    validates :post_num, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid.Include hyphen(-)' }
    validates :city
    validates :address
    validates :telephone_num, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :post_address_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, post_address_id: post_address_id, city: city, address: address, build: build,
                   telephone_num: telephone_num, order_id: order.id)
  end
end

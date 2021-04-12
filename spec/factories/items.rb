FactoryBot.define do
  factory :item do
    name                { '遊戯王カード' }
    text                { '結構昔のもので少し破けています' }
    category_id         { 7 }
    status_id           { 5 }
    delivery_fee_id     { 2 }
    post_address_id     { 32 }
    post_daytime_id     { 2 }
    price               { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end

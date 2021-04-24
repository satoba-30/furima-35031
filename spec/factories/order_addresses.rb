FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_num { '123-4567' }
    post_address_id { 7 }
    city { '東京都' }
    address { '1-1' }
    build { '東京ハイツ' }
    telephone_num { '99012345678' }
  end
end

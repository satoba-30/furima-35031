FactoryBot.define do
  factory :user do
    nickname                      {'satosi'}
    email                         {Faker::Internet.free_email}
    password                      {'testtest30'}
    password_confirmation         {password}
    last_name                     {'相園'}
    first_name                    {'智史'}
    last_name_kana                {'アイゾノ'} 
    first_name_kana               {'サトシ'}
    birthday                      {'2000-08-30'} 
  end
end
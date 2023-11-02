FactoryBot.define do
  factory :order_address do
    user_id        { 1 }
    item_id        { 1 }
    post_code      { "123-4567" }
    prefectures_id { 14 }
    city           { "新宿区" }
    city_address   { "1-1-1" }
    building_name  { "テックテック101号室" }
    telephone      { "12312345678" }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end

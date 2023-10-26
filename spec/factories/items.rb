FactoryBot.define do
  factory :item do
    name               { '冷蔵庫' }
    explanation        { 'これは食材や飲み物を冷やすもので、扉が３つあります。' }
    category_id        { 3 }
    condition_id       { 3 }
    shopping_charge_id { 3 }
    shopping_days_id   { 3 }
    prefectures_id     { 3 }
    price              { 500 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

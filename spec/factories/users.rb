FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '清水' }
    last_name             { '朋幸' }
    first_kana            { 'シミズ' }
    last_kana             { 'トモユキ' }
    birth_day             { '1998-01-20' }
  end
end

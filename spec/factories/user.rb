FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'test0124' }
    password_confirmation { password }
    first_name            { '鈴木' }
    last_name             { '出馬' }
    first_name_katakana   { 'スズキ' }
    last_name_katakana    { 'イズマ' }
    birth_day             { Faker::Date.between(from: 65.years.ago, to: 18.years.ago) }
  end
end

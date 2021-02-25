FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000' }
    password_confirmation { 'aaa000' }
    last_name             { '加嶋' }
    first_name            { '太郎' }
    last_name_kana        { 'カシマ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1932-02-01' }
  end
end

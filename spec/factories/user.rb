FactoryBot.define do
  factory :user do
    id { 2 }
    # sequence(:id) { |n| n } # データを生成する毎に通し番号をふってユニークな値を作る
    email { 'test@test.com' }
    # sequence(:email) { |n| "test#{n}@example.com" } # データを生成する毎に通し番号をふってユニークな値を作る
    password { 'tttttt' }
    name { 'number1' }
    admin { false }
  end
end

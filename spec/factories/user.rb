FactoryBot.define do
  factory :admin do
    email { 'example@example.com' }
    password { 'aaaaaaaa' }
  end

  factory :staff do
    email { 'staff@example.com' }
    # sequence(:email) { |n| "test#{n}@example.com" } # データを生成する毎に通し番号をふってユニークな値を作る
    password { 'ssssssss' }
    name { 'staff1' }
    role_id { 1 }
  end

  factory :user do
    email { 'customer@example.com' }
    # sequence(:email) { |n| "test#{n}@example.com" } # データを生成する毎に通し番号をふってユニークな値を作る
    password { 'cccccccc' }
    name { 'customer1' }
    role_id { 2 }
  end

  # factory :guest_user do
  #   email { 'guest@example.com' }
  #   # sequence(:email) { |n| "test#{n}@example.com" } # データを生成する毎に通し番号をふってユニークな値を作る
  #   password { 'cccccccc' }
  #   name { 'guest1' }
  #   role_id { 3 }
  # end
end

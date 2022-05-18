FactoryBot.define do
  factory :user do
    id { 2 }
    email { 'test@test.com' }
    password { 'tttttt' }
    name { 'number1' }
    admin { false }
  end
end

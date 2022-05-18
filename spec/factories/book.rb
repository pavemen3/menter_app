FactoryBot.define do
  factory :book do
    id { 1 }
    user_id { 2 }
    title { 'テスト本1' }
    body { '豊富なコンテンツ量に圧倒されます' }
    # genre { 1 } #enumのとき、Numberでも文字列値でもテストは通った
    genre { '音楽' }
  end
end

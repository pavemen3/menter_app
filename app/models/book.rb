class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  enum genre: {
    # "---":0,
    文学・評論: 1,
    ノンフィクション: 5,
    ビジネス・経済: 10,
    歴史・地理: 15,
    政治・社会: 20,
    芸能・エンターテインメント: 25,
    アート・建築・デザイン: 30,
    人文・思想・宗教: 35,
    サイエンス・テクノロジー: 40,
    趣味・実用: 45,
    教育・自己啓発: 50,
    スポーツ・アウトドア: 55,
    事典・年鑑・本・ことば: 60,
    音楽: 65,
    旅行・紀行: 70,
    絵本・児童書: 75,
    コミックス: 80
  }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end

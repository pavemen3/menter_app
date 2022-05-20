class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :books, dependent: :destroy
  belongs_to :role

  def get_avatar(width, height)
    unless avatar.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      avatar.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    avatar.variant(resize_to_limit: [width, height]).processed
  end
end

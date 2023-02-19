class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #プロフィール画像設定用
  has_one_attached :profile_image

  #ゲストログイン用
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.birthday = Date.new(2000, 12, 1)
    end
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image: 'no_image.jpg'
  end

end

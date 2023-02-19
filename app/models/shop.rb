class Shop < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

end

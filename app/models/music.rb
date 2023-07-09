class Music < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :album
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :audio, AudioUploader
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
end

class Music < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorit_users, through: :favorites, source: :user
  has_many :albums, dependent: :destroy
  mount_uploader :audio, AudioUploader
  validates :name, presence: true, length: { maximum: 20 }
  
  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
  
  # belongs_to :albums

  def albumed_by?(user)
    albums.where(user_id: user).exists?
  end
  
  def self.search(keyword)
   where(["name like?","%#{keyword}%"])
  end
  
end

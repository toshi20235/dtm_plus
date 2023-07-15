class Album < ApplicationRecord
  validates :user_id, uniqueness: { scope: :music_id }
end

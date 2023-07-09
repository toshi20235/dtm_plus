class Album < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }
end

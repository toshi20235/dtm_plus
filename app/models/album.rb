class Album < ApplicationRecord
  belongs_to :user
  has_many :music, dependent: :destroy
end

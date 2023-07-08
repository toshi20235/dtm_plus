class Album < ApplicationRecord
  has_many :music, dependent: :destroy
end

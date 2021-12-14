class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :career, format: { with: /\A[0-9]+\z/ }
end

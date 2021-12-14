class FishInfo < ApplicationRecord
  belongs_to :fish_name
  belongs_to :user
  has_many :rankings
  has_one_attached :image

  with_options presence: true do
    validates :day
    validates :fish_size, format: { with: /\A[0-9]+\z/ }
    validates :fish_num, format: { with: /\A[0-9]+\z/ }
    validates :memo
    validates :fish_name
    validates :user
  end
end

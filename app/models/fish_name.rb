class FishName < ApplicationRecord
  belongs_to :user
  has_many :fish_infos
  has_many :rankings

  validates :fish_kind, presence: true, format: {with: /\A[ァ-ヶー]+\z/}
end

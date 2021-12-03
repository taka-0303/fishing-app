class User < ApplicationRecord
  has_one :profile
  has_many :fish_names
  has_many :fish_infos
  has_many :rankings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
end

class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations, dependent: :destroy

  validates :name, presence: true
  validates :about, presence: true
  validates :price_hour, presence: true
end

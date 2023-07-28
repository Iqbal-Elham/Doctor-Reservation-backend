class Doctor < ApplicationRecord
  has_many :reservations
  has_many :patients, through: :reservations

  validates :name, presence: true
  validates :about, presence: true
  validates :price, presence: true
end

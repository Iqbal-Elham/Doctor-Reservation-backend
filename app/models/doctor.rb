class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :patients, through: :reservations, dependent: :destroy

  validates :name, presence: true
  validates :about, presence: true
  validates :price, presence: true
end

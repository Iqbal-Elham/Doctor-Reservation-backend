class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :patients, through: :reservations, dependent: :destroy
end

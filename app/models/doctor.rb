class Doctor < ApplicationRecord
  has_many :reservations
  has_many :patients, through: :reservations
end

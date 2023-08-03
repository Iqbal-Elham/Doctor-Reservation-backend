class Patient < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :doctors, through: :reservations, dependent: :destroy
end

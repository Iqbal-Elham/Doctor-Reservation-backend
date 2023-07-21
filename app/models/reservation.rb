class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :city, presence: true
  validates :date, presence: true
  validates :time, presence: true
end

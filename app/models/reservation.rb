class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :city, presence: true
  validates :appointment_time, presence: true
end

class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :appointment_time, presence: true
end

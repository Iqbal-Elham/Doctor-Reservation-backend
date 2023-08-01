class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :username

  validates :appointment_time, presence: true
end

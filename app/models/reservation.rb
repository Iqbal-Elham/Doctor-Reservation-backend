class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  validates :appointment_time, presence: true
  validates :appointment_date, presence: true
end

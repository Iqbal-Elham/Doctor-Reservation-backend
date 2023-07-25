class Api::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @reservation_data = @reservations.map do |reservation|
      {
        photo: Doctor.find(reservation.doctor_id).photo,
        id: reservation.id,
        appointment_time: reservation.appointment_time,
        doctor: Doctor.find(reservation.doctor_id).name,
        patient: Patient.find(reservation.patient_id).name
      }
    end
    render json: @reservation_data
  end
end

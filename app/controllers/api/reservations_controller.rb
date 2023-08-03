module Api
  class ReservationsController < ApplicationController
    before_action :set_reservation, only: %i[show update destroy]
    skip_before_action :verify_authenticity_token, only: %i[destroy create]

    # GET /reservations
    def index
      @reservations = Reservation.all
      reservation = @reservations.map do |reserve|
        doctor = Doctor.find(reserve.doctor_id)
        {
          photo: doctor.photo,
          id: reserve.id,
          city: reserve.city,
          appointment_date: reserve.appointment_date,
          appointment_time: reserve.appointment_time,
          doctor_name: doctor.name
        }
      end
      render json: reservation
    end

    # POST /reservations
    def create
      @user = User.find_by(username: params[:username])
      @reservation = @user.reservations.build(reservation_params)
      if @reservation.save
        render json: @reservation, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    # GET /reservations/:id
    def show
      render json: Reservation.new(@reservation).as_json
    end

    # PATCH/PUT /reservations/:id
    def update
      @reservation.update(reservation_params)
      if @reservation.save
        render json: Reservation.new(@reservation).as_json, status: :created
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    # DELETE /reservations/:id
    def destroy
      @reservation.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reservation_params
      params.require(:reservation).permit(:username, :appointment_date, :appointment_time, :doctor_id, :city)
    end
  end
end

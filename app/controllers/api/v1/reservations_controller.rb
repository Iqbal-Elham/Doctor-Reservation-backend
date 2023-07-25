module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_reservation, only: [:show, :update, :destroy]

      # GET /reservations
      def index
        @reservations = Reservation.all
        @reservation_data = @reservations.map do |reservation|
          doctor_photo_url = reservation.doctor&.photo&.attached? ? rails_blob_url(reservation.doctor.photo) : nil

          {
            url: doctor_photo_url,
            id: reservation.id,
            city: reservation.city,
            # date: reservation.appointment_time.to_date,
            appointment_time: reservation.appointment_time,
            doctor: Doctor.find(reservation.doctor_id).name
          }
        end
        render json: @reservation_data
      end

      # POST /reservations
      def create
        @user = User.find(params[:reservation][:user_id])
        @reservation = @user.reservations.build(reservation_params)
        if @reservation.save
          render json: Reservation.new(@reservation).as_json, status: :created
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
          params.require(:reservation).permit(:name, :city, :date, :time, :doctor_id)
        end
    end
  end
end

module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :authenticate_request!, only: [:create, :update, :destroy ]
      before_action :set_reservation, only: [:show, :update, :destroy]

      # GET /reservations
      def index
        @reservations = Reservation.all
        render json: @ReservationsRepresenter.new(@reservations).as_json
      end

      # POST /reservations
      def create
        @reservation = @current_user.reservations.new(reservation_params)

        if @reservation.save
          render json: ReservationsRepresenter.new(@reservation).as_json status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # GET /reservations/:id
      def show
        render json: ReservationsRepresenter.new(@reservation).as_json
      end

      # PATCH/PUT /reservations/1
      def update
        @reservation.update(reservation_params)
        if @reservation.save
          render json: ReservationsRepresenter.new(@reservation).as_json, status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /reservations/1
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
class Api::DoctorsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    render json: { message: 'Doctor deleted successfully' }
  end
end

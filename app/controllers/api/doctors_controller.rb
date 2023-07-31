class Api::DoctorsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[destroy create]

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def create
    @doctor = Doctor.new(doctors_params)
    # if Doctor.where(name: @user.name).exists?
    #   render json: { status: 'ERROR', message: 'Doctor already exists' }, status: :unprocessable_entity
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: { message: @doctor.errors }, status: 400
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: @doctor
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    render json: { message: 'Doctor deleted successfully' }
  end

  private

  def doctors_params
    params.require(:doctor).permit(:name, :photo, :about, :price_hour)
  end
end

class Api::DoctorsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find(params[:id])
    @doctordata = {
      id: @doctor.id,
      name: @doctor.name,
      about: @doctor.description,
      photo: rails_blob_url(@doctor.photo),
      price: @doctor.price,
      user_id: @doctor.user_id,
      username: @doctor.user.username
    }
    render json: @doctor
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    render json: { message: 'Doctor deleted successfully' }
  end
end

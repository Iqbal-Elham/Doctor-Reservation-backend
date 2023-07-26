class Api::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find(params[:id])
    # @doctordata = {
    #   id: @doctor.id,
    #   name: @doctor.name,
    #   about: @doctor.description,
    #   # photo: rails_blob_url(@car.photo),
    #   price: @doctor.price,
    #   user_id: @doctor.user_id,
    #   username: @doctor.user.username
    # }
    render json: @doctor
  end
end

class Api::DoctorsController < ApplicationController
    @doctors = Doctor.all
    render json: @doctors
end

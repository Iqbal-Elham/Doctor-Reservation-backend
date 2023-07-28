class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    user = User.new(user_params)
    if User.where(username: user.username).exists?
      render json: { status: 'ERROR', message: 'User already exists' }, status: :unprocessable_entity
    elsif user.save
      render json: { status: 'SUCCESS', message: 'Saved user', data: user }, status: :ok
    else
      render json: { status: 'ERROR', message: 'User not saved', data: user.errors },
             status: :unprocessable_entity
    end
  end

  def show
    user = User.where(username: params[:username]).first
    if user.nil?
      render json: { status: 'ERROR', message: 'User not found' }, status: :unprocessable_entity
    else
      render json: { status: 'SUCCESS', message: 'Loaded user', data: user }, status: :ok
    end
  end

  def destroy
    user = User.where(username: params[:username]).first
    user&.reservations&.destroy_all
    return render json: { status: 'ERROR', message: 'User not found' }, status: :unprocessable_entity if user.nil?

    if user.destroy
      render json: { status: 'SUCCESS', message: 'Deleted user', data: user }, status: :ok
    else
      render json: { status: 'ERROR', message: 'User not deleted', data: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :full_name)
  end
end

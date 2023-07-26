class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      token = generate_token(@user.id)
      render json: { user: @user, token: }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def generate_token(user_id)
    JWT.encode({ user_id: }, Rails.application.credentials.secret_key_base)
  end
end

class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:session][:username])
    
        if @user && @user.authenticate(params[:session][:password])
          token = JWT.encode({ user_id: @user.id }, 'your_secret')
          render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
        else
          render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
      end
end

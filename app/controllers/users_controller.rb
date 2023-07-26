class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
          token = generate_token(@user.id)
          render json: { user: @user, token: token }
        else
          render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def generate_token(user_id)
        JWT.encode({ user_id: user_id }, Rails.application.credentials.secret_key_base)
      end
end

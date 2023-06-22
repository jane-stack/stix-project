class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    # POST /login
    def create
        user = User.find_by_username(params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: { errors: ["Username or Password didn't match"] }, status: :unprocessable_entity
        end
    end

    # DELETE /logout
    def destroy
        session.delete :user_id
        render json: { message: "You've Logged Out" }
    end
end

class SessionsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
    def create
        user= User.find_by(username: params[:username])
        if user.username == params[:username]
            session[:user_id] = user.id
            render json: user, status: :ok
        else
        end
    end
    def destroy
        session.delete :user_id
        head :no_content
    end
    private
    def user_not_found
        render json: {error: "wrong username"}, status: :unauthorized
    end
end


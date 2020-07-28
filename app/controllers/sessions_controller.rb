class SessionsController < ApplicationController

    def omniauth  #log users in with omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to root_path
        end
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Invalid Sign In info, please try again."
            redirect_to '/signin'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

private
    def auth
        request.env['omniauth.auth']
    end
end

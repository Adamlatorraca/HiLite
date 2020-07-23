class SessionsController < ApplicationController
    
    def destroy
        session.clear
        root_path
    end

    def create
        #session[:user]
    end
end

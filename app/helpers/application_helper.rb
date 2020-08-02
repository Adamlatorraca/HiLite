module ApplicationHelper
    def current_user
        # if limits db queries
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    
    def signed_in?
        # most effiecient
        !!session[:user_id]
    end

    def redirect_if_not_signed_in
        flash[:error] = "Please Sign in."
        redirect_to signin_path if !signed_in?
    end
end

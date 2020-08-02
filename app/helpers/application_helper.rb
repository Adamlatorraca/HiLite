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

    def authorized?
        @hilite.user == current_user
    end

    def redirect_if_not_authorized
        flash[:error] = "You can only edit your own HiLites."
        redirect_to hilites_path if !authorized?
    end
end

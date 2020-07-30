class ApplicationController < ActionController::Base
    helper_method :current_user, :signed_in?, :authorized?


private
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
    @hilite = Hilite.find(params[:id])
    @hilite.user == current_user
  end

  def redirect_if_not_authorized
    if !authorized?
      flash[:error] = "You do not have the correct permissions to do that."
      redirect_to hilites_path
    end
  end

end

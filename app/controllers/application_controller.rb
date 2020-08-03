class ApplicationController < ActionController::Base
  include ApplicationHelper
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  protect_from_forgery with: :exception
  
  private

  def handle_record_not_found
    render :"shared/not_found"
  end
end

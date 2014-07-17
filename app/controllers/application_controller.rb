class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user
  before_action :authorize

  protected

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end

  	def authorize
  		redirect_to login_url, alert: "Please log in" unless @current_user
  	end
  	
  	def redirect_if_not_admin
      redirect_to home_url, alert: "This action ist not allowed" unless @current_user.admin
    end
end

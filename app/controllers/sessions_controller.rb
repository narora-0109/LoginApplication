class SessionsController < ApplicationController
  layout 'login', only: "new"

  skip_before_action :authorize, only: [:new, :create]

  def new
    redirect_to admin_url if @current_user
  end

  def create
  	user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, notice: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Logged out"
  end
end
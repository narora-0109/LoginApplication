class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_admin, except: [:edit, :update]
  before_action :redirect_if_not_allowed, only: [:edit, :update]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /users/1
  def destroy
    respond_to do |format|
      if @user.destroy 
        format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      else
        format.html { redirect_to users_url, alert: 'User could not be deleted.'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :surname, :firstname, :email, (:admin if @current_user.admin))
    end
    
    def redirect_if_not_allowed
      redirect_to home_url, alert: "This action ist not allowed" if @current_user != @user && !@current_user.admin
    end
end

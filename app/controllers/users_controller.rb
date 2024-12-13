class UsersController < ApplicationController
  before_action :require_login, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      redirect_to users_path, alert: "User not found."
    elsif @user.private? && !current_user.following?(@user)
      redirect_to users_path, alert: "You're not authorized for that."
    else
      @photos = @user.photos
    end
  end
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "Account created successfully."
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :private)
  end
end

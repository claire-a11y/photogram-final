class SessionsController < ApplicationController
  

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to users_path, notice: "Signed out successfully."
  end
end

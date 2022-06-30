class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash[:alert] = 'email or password is incorrect'
      render :new
    end
  end

  def destroy
    sessions[session_id] = nil
    redirect_to root_path, notice: 'logged out', alert: 'ogged out'

  end
end
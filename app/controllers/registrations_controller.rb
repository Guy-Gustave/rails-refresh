class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successifully created "
    else
      flash[:notice] ="error in creating user"
      render :new  
    end
  end
   
   def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
   end
end
class UsersController < ApplicationController
  def new
  end

  def create
  @user = User.create(user_params)
  if @user.valid?
    session[:username] = @user.username
    session[:user] = @user.id
    session[:show_all] = true
    redirect_to "/tasks"
  else
    flash[:errors] = @user.errors.full_messages
    redirect_to "/users/new"
  end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

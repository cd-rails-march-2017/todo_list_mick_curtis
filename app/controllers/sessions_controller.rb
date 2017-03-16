class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.login(params[:username], params[:password])
    if @user
      session[:username] = @user.username
      session[:user] = @user.id
      session[:show_all] = true
      redirect_to "/tasks"
    else
      redirect_to "/login", notice: "Invalid username or password"
    end
  end
  def destroy
    session.clear
    redirect_to '/login'
  end

  def update
    if session[:show_all] == true
      session[:show_all] = false
    else
      session[:show_all] = true
    end
    redirect_to "/tasks"
  end
end

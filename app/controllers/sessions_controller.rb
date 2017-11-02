class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    redirect_to projects_path 
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

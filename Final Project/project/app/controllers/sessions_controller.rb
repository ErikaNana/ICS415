class SessionsController < ApplicationController
    skip_before_action :set_current_user #for first time login

  def create
    auth = request.env["omniauth.auth"]
    user = User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to '/home'
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
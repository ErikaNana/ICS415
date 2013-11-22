class ApplicationController < ActionController::Base
    before_action :set_current_user #requires that a user is logged in for an action to be run
    protected #prevents method from being invoked by a route

  def set_current_user #checks to see if logged in
    @current_user = User.find_by_id(session[:user_id])
  end
end
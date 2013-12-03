class ApplicationController < ActionController::Base
    before_action :set_current_user #requires that a user is logged in for an action to be run
    protected #prevents method from being invoked by a route

  def set_current_user #checks to see if logged in THIS DOESN'T WORK SO FAR
    @current_user = OUser.find_by_id(session[:user_id])
    @date = Date.today.strftime("%B %d, %Y")
    if @current_user == nil
        redirect_to root_path
    end
  end
end
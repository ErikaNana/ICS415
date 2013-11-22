class ApplicationController < ActionController::Base
    before_action :set_current_user #requires that a user is logged in for an action to be run
    protected #prevents method from being invoked by a route

  def set_current_user #checks to see if logged in
    #raise session[:user_id].inspect
    #raise session[:id].inspect
    @current_user = User.find_by_id(session[:user_id])
=begin
    if @current_user = nil
        redirect_to login_page_path
    else
        redirect_to '/welcome'
    end
=end

  end
end
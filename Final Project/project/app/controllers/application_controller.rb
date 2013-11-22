class ApplicationController < ActionController::Base
    before_filter :set_current_user #requires that a user is logged in for an action to be run
    protected
  def set_current_user
    #raise session[:user_id].inspect
    @current_user = User.find_by_id(session[:user_id])
    if @current_user != nil
            raise @current_user.inspect
    end
    #redirect_to '/auth/facebook' and return unless @current_user
  end
end
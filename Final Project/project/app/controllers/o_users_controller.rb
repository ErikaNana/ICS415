class OUsersController < ApplicationController
    skip_before_action :set_current_user, only:[:create, :validate, :signup]
  def new
  end
  def create
    #raise @user.inspect
    @user = OUser.create!(params[:user])
    session[:user_id] = @user.id
    redirect_to home_path
  end
  def show
    @user = User.find(params[:id])
  end
  def validate
    if !params.has_key?("user") #guest
        @user = OUser.create!(:name => "Guest")
        session[:user_id] = @user.id
        redirect_to home_path
    else
        @user = OUser.find_by email: params[:user][:email]
        if @user == nil
            redirect_to signup_path
        else #validate
            password = @user.password
            if params[:user][:password] == password
                session[:user_id] = @user.id
                redirect_to home_path
            else
                flash[:warning] = "Please try again"
                redirect_to :back
            end
        end
    end
end
end

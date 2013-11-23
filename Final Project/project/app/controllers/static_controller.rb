class StaticController < ApplicationController
    #skip_before_action :set_current_user #does it's own check here, for first time login
    def home
        #@current_user = User.find_by_id(session[:user_id]);
        #raise params[:class].inspect
        @classes = StudentClass.all
    end
    def welcome
    end
    def about
    end
end

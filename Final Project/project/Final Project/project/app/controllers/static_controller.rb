class StaticController < ApplicationController
    skip_before_action :set_current_user, only:[:welcome, :about] #avoid redirect loop

    def home
        @classes = Course.find(:all, :conditions =>{:user_id => @current_user.id})
        @week = Date.today.at_beginning_of_week.strftime("%B %d, %Y")
        @endWeek = Date.today.at_beginning_of_week.advance(:days => 6)
        @date = Date.today.strftime("%B %d, %Y")
    end
    def welcome
        @date = Date.today.strftime("%B %d, %Y")
    end
    def about
        @current_user = OUser.find_by_id(session[:user_id])
        @date = Date.today.strftime("%B %d, %Y")
    end
end

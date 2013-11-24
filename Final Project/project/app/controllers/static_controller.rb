class StaticController < ApplicationController
    skip_before_action :set_current_user, except:[:home] #for first time login
    def home
        #@current_user = User.find_by_id(session[:user_id]);
        #raise params[:class].inspect
        @classes = StudentClass.all
        @week = Date.today.at_beginning_of_week.strftime("%B %d, %Y")
        @endWeek = Date.today.at_beginning_of_week.advance(:days => 6)
    end
    def welcome
    end
    def about
    end
end

class StaticController < ApplicationController
    skip_before_action :set_current_user, except:[:home] #should be logged in at this point

    def home
        @classes = Course.all
        @week = Date.today.at_beginning_of_week.strftime("%B %d, %Y")
        @endWeek = Date.today.at_beginning_of_week.advance(:days => 6)
        @date = Date.today.strftime("%B %d, %Y")
    end
    def welcome
        @date = Date.today.strftime("%B %d, %Y")
    end
    def about
        @date = Date.today.strftime("%B %d, %Y")
    end
end

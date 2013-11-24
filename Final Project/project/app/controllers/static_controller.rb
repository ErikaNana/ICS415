class StaticController < ApplicationController
    skip_before_action :set_current_user, except:[:home] #should be logged in at this point

    def home
        @classes = Course.all
        @week = Date.today.at_beginning_of_week.strftime("%B %d, %Y")
        @endWeek = Date.today.at_beginning_of_week.advance(:days => 6)
    end
    def welcome
    end
    def about
    end
end

class CoursesController < ApplicationController
  def index
    @courses = Course.all
    redirect_to home_path
  end

  def show
    @course = Course.find_by_id(params[:id])
    @id = params[:id]
    @assignments = Assignment.find(:all, :conditions =>{:course_id => params[:id], :user_id => @current_user.id})
    @week = Date.today.at_beginning_of_week.strftime
    @endWeek = Date.today.at_beginning_of_week.advance(:days => 6)
    @nextWeek = Date.today.at_beginning_of_week.advance(:days => 7) #not formatted
    @endNextWeek = @nextWeek.advance(:days => 6)
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find_by_id(params[:id])
  end

  def create
    params[:class][:user_id] = @current_user.id
    @course = Course.create!(params[:class])
    redirect_to home_path
  end

  def update
    @course = Course.find_by_id(params[:id])
    @course.update_attributes!(params[:class])
    redirect_to course_path(params[:id])
  end

  def destroy
    @course = Course.find_by_id(params[:id])
    @course.destroy
    redirect_to home_path
  end

=begin
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :dueDate, :priority)
    end
=end

end

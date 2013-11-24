class CoursesController < ApplicationController
  def index
    @courses = Course.all
    redirect_to home_path
  end

  def show
    @course = Course.find_by_id(params[:id])
    @id = params[:id]
    @assignments = Assignment.find(:all, :conditions =>{:className => @course.name})
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.create!(params[:class])
    redirect_to home_path
  end

  def update
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

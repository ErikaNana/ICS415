class AssignmentsController < ApplicationController
  def create
    @course = Course.find_by_id(params[:course_id])
    params[:assignment][:className] = @course.name #for querying an assignment for a particular class
    if params[:assignment].values.include?("") #check if there are empty fields
      flash[:warning] = "Please fill in all fields"
      redirect_to :back
    else
      @assignment = Assignment.create!(params[:assignment])
      redirect_to course_path(params[:course_id])
    end
  end

  def new
  end

  def destroy
  end
  def show
    @assignment = Assignment.find_by_id(params[:id])
  end
end
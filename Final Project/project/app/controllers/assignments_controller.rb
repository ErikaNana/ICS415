class AssignmentsController < ApplicationController
  def create
    @course = Course.find_by_id(params[:course_id])
    params[:assignment][:className] = @course.name #for querying an assignment for a particular class
    if params[:assignment].values.include?("") #check if there are empty fields
      flash[:warning] = "Please fill in all fields"
      redirect_to :back
    else
      Assignment.create!(params[:assignment])
      raise @assignment.inspect
      #redirect_to course_path(params[:course_id])
    end
  end

  def new
  end

  def destroys
  end

end
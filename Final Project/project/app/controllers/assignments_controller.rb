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
  def edit
    @assignment = Assignment.find(params[:id])
  end
  def destroy
    #raise
    @assignment = Assignment.find_by_id(params[:id])
    @assignment.destroy
    redirect_to :back
  end
  def show
    @assignment = Assignment.find_by_id(params[:id])
    @week = Date.today.at_beginning_of_week.strftime("%B %d, %Y")
    @endWeek = Date.today.at_beginning_of_week.advance(:days => 6)
  end
  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update_attributes!(params[:assignment])
    redirect_to course_path(:id => params[:course_id])
  end

  def done
    raise
  end
end
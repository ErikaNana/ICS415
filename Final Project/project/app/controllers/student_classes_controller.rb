class StudentClassesController < ApplicationController

  def index
    @student_classes = StudentClass.all
    redirect_to home_path
  end

  def show
    @student_class = StudentClass.find_by_id(params[:id])
  end

  def new
    @student_class = StudentClass.new
  end

  def edit
  end

  def create
    #raise params[:class][:name].inspect
    @student_class = StudentClass.create!(params[:class])
    redirect_to home_path
  end

  def update
    respond_to do |format|
      if @student_class.update(student_class_params)
        format.html { redirect_to @student_class, notice: 'Student class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student_class.destroy
  end

=begin
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_class
      @student_class = StudentClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_class_params
      params.require(:student_class).permit(:name, :dueDate, :priority)
    end
=end

end

class StudentsController < ApplicationController
  def index
    @students = Student.all
    @students = Student.new
  end

  def create
    @students = Student.new(student_params)
    @students.save
    redirect_to students_url
  end



  private
  def student_params
    params.require(:student).permit(:code, :name, :email, :cel )
  end



end

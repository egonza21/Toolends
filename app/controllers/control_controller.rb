class ControlController < ApplicationController

  before_action :get_tools
  before_action :get_students




  private

  def get_tools
    @tools = Tool.all
  end
  def get_students
    @students = Student.all
  end

  def show
    @tools = @tools.where("title ILIKE ?", "%#{params[:title]}%")
    #@pro = @tools.title
  end


end

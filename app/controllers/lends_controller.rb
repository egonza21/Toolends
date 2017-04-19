class LendsController < ApplicationController
  def index
  end

    before_action :get_tools
    before_action :get_students

    def index
      @lends = Lend.new
    end
    def create
      @lends = Lend.new(student: params[:lend])
      @lends.students = params[:students]
      @lends.save
      redirect_to control_url
    end



    private
    def lend_params
      params.require(:lend).permit(:iud)
    end
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

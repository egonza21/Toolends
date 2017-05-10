class ToolsController < ApplicationController



def index
  @tools = Tool.all
#  @tools = Tool.search(params[:search])
end




  #def new
  #  @tools = Tool.new
#  end
  def create
    @tools = Tool.new(tool_params)
    if @tools.save
      redirect_to tools_url
    else
      #si no guardo, que salga un mensaje

      render :index
    end
  end




  private
  def tool_params
    params.require(:tool).permit(:title, :quantity)
  end
end

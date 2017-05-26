class ToolsController < ApplicationController



def index
  @tool = Tool.new
#  @tools = Tool.search(params[:search])
end




  #def new
  #  @tools = Tool.new
#  end
  def edit

  end


  def update
    #  respond_to do |format|
    #  @tool.update()
    #  redirect_to tools_url
    #  end
    # respond_to do |format|
    #   if @tool.update(tool_params)
    #     format.html { redirect_to @tool, notice: 'User was successfully updated.' }
    #     format.json { render :index, status: :ok, location: @tool }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @tool.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  def search_tools
    @tool = Tool.where('title = ?', params[:title])
    @tool.each do |t|
      return t.quantity
    end
    puts "Buscar"
    redirect_to tools_url
  end

  def update_tool
    puts "Editar"
  end

  def create

    if params[:Guardar]
      @tool = Tool.new(tool_params)
      if @tool.save
        redirect_to tools_url
      else
        #si no guardo, que salga un mensaje

        render :index
      end

    elsif params[:Editar]
      update
    elsif params[:Buscar]
      @tool = Tool.new(tool_params)
      titlet = tool_params[:title]
      herr = Tool.find_by(title: titlet)
      if params[:Buscar]
        @tool = Tool.new(tool_params)
        @tool.id = herr.id
        @tool.title = herr.title
        @tool.quantity = herr.quantity
        render :index
      end
      # elsif params[:Editar]
      #   @tool.update(tool_params)
      #   render :index
      # end
    end
  end




  private
  def tool_params
    params.require(:tool).permit(:id, :title, :quantity)
  end



end

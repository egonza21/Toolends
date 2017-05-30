class ToolsController < ApplicationController



  def index
    @tool = Tool.all
    @tool = Tool.new


  #  @tools = Tool.search(params[:search])
  end



  def pick_tools

    puts "HOLAHOAKJFOFHE"
    puts "----------------------------------------------------------------------------------------------------------------"
    render :index
  end

  def search_tools


    @tool = Tool.new(tool_params)
    titlet = tool_params[:title]
    #herr = Tool.find_by(title: titlet)
    herr = Tool.where("title like ?", "%#{titlet}%")
    herr.each do |r|
      @tool.id = r.id
      @tool.title = r.title
      @tool.quantity = r.quantity
    end
    render :index

  end

  def update_tool
    @valor_titulo = params[:tool][:title]
    @tool = Tool.where('title = ?', @valor_titulo)
    @tool.update({quantity: params[:tool][:quantity]})
    puts "Editar"
    redirect_to tools_url
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
    end

  end




  private
  def tool_params
    params.require(:tool).permit(:id, :title, :quantity)
  end



end

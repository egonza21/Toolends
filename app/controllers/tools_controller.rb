class ToolsController < ApplicationController



def index
  @tool = Tool.all
  @tool = Tool.new
  if @bandera
    @bandera = false
    @tool.quantity = search_tools
    redirect_to tools_url
  end

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


    @tool = Tool.new(tool_params)
    titlet = tool_params[:title]
    herr = Tool.find_by(title: titlet)
    @tool.id = herr.id
    @tool.title = herr.title
    @tool.quantity = herr.quantity
    render :index

  #   @valor_titulo = params[:tool][:title]
  #   puts @valor_titulo
  #   @tool = Tool.where('title = ?', @valor_titulo)
  #
  #   puts "hoa"
  #
  # #  puts @tool.quantity
  # #  params[:tool][:quantity] = @tool.quantity
  #
  #   @tool.each do |t|
  #     @bandera = true
  #     #@tool.quantity = t.quantity
  #     puts t.quantity
  #     params[:tool][:quantity] = t.quantity
  #
  #     return t.quantity
  #   end
  #   puts "Buscar"
  #   redirect_to tools_url
  #   #return @valor
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

class LendToolsController < ApplicationController
	def add
		@bandera2 = true
		if @bandera2
			puts "if de bandera"
			tag_student = session[:prueba]
			#@lends = Lend.where('uid = ?', session[:prueba])
			@lends = Lend.last()
			params[:lend] = @lends
			# @lends.each do |lend|
			# 	@lend_id = lend.id
			# 	puts @lend_id
			# end
			puts params[:lend]
			@bandera2 = false
		end
		name_tool = params[:name]
		@tool = Tool.where('title = ?', name_tool)
		puts @tool
		params[:tool] = @tool
		@tool.each do |tool|
			@tool_id = tool.id
			puts @tool_id
			puts "cantidad"
			@quantity_tool = tool.quantity
			puts @quantity_tool

			@quantity_t = @quantity_tool.to_i
			@new_quantity_tool = 0

			if @quantity_t > 0
				@new_quantity_tool = @quantity_t - 1
				puts "Cantidad que queda"
				puts @new_quantity_tool
			end
		end
		@new_quantity_t = @new_quantity_tool.to_s
		puts @new_quantity_t
		params[:amount] = 1
		@uno = 1
		@tool.update({quantity: @new_quantity_t})
		#@lend_tools = LendTool.new(toolend_params)
		puts "va para el param"
		console
		puts params[:lend]
		@lend_tools = LendTool.new(toolend_params)
		@lend_tools.tool = params[:tool]
		@lend_tools.lend = params[:lend]
		@lend_tools.save
    puts "holaaa"

    redirect_to lends_url

  end

	def finish
		@bandera2 = true
	end

	private
	def toolend_params
	  params.require(:lend_tools).permit(:amount, :student_id, :tool_id)
	end
end
=begin  Este si sirve
    def create
      #@lends = Lend.new(uid: params[:lend][:uid],
      #                    tool_id: params[:lend][:tool_id],
      #                    student_id: params[:lend][:student_id])

      @herra = params[:@herra]

      i=0
      while i < @herra.size do
        @lends = Lend.new(uid: params[:lend][:uid],
                            tool_id: @herra[i],
                            student_id: params[:lend][:student_id])
        #@lends.tool_id=@herra[i]
        puts @lends.tool_id
        @lends.save
        i=i+1
      end

=end

class LendToolsController < ApplicationController
	def add

		@lend = Lend.where(student_id: params[:id_student]).last
		@lend_id = @lend.id
		puts @lend.id

		@tool = Tool.find(params[:id_tool])
		puts @tool.quantity
		quantity_actual = @tool.quantity.to_i
		quantity_new = quantity_actual - 1 	#cuando varios hagan prestamos al tiempo
		quantity_final =quantity_new.to_s
		@tool.update({quantity: quantity_final})

		# LendTool.where(student: XXXX).last.toolends
		@lend_tools = LendTool.where(lend_id: @lend_id)
		puts @new_tools
		@lend_tools = LendTool.new(amount: params[:amount], tool_id: params[:id_tool], lend_id: @lend_id)
		@lend_tools.save
		puts "Terminó"

		#
		# @bandera2 = true
		# if @bandera2
		# 	puts "if de bandera"
		# 	tag_student = session[:prueba]
		# 	#@lends = Lend.where('uid = ?', session[:prueba])
		# 	@lends = Lend.last()  # Lend.where(student_id: lend_student.id).last
		# 	# params[:lend] = @lends
		# 	# puts params[:lend]
		# 	puts "Imprimolendprams"
		# 	@lends_id = @lends.id
		# 	# @lends.each do |le|
		# 	# 	@lends_id = le.id
		# 	# 	puts @lends_id
		# 	# end
		# 	#puts params[:lend]
		# 	@bandera2 = false
		# end
		# id_tool = params[:name]
		# 						#@tool = Tool.where('id = ?', id_tool) #Tool.find(params[:tool_id])
		# @tool = Tool.find(params[:id_tool])
		# puts @tool
		# params[:tool] = @tool
		# puts params[:tool]
		# puts "Imprimiotoolparamss"
		# @tool.each do |tool|
		# 	@tool_id = tool.id
		# 	puts @tool_id
		# 	puts "cantidad"
		# 	@quantity_tool = tool.quantity
		# 	puts @quantity_tool
		#
		# 	@quantity_t = @quantity_tool.to_i
		# 	@new_quantity_tool = 0
		#
		# 	if @quantity_t > 0
		# 		@new_quantity_tool = @quantity_t - 1 #cuando varios hagan prestamos al tiempo
		# 		puts "Cantidad que queda"
		# 		puts @new_quantity_tool
		# 	end
		# end
		# @new_quantity_t = @new_quantity_tool.to_s
		# puts @new_quantity_t
		# # params[:amount] = 1
		# # @uno = 1
		# @tool.update({quantity: @new_quantity_t})
		# #@lend_tools = LendTool.new(toolend_params)
		# puts "va para el param"
		# console
		# puts params[:lend]
		# # LendTool.where(student: XXXX).last.toolends
		# @lend_tools = LendTool.new(amount: params[:amount], tool_id: @tool_id, lend_id: @lends_id)
		# # @lend_tools.tool = @tool
		# # @lend_tools.lend = @lends
		# @lend_tools.save
    # puts "holaaa"
		#


    redirect_to lends_url

  end

	def destroy
		#id_tool = params[:name]
						#@tool = Tool.where('id = ?', id_tool)
		@tool = Tool.find(params[:id_tool])
		@tool.each do |tool|
			@tool_id = tool.id
			@quantity_tool = tool.quantity
			@quantity_t = @quantity_tool.to_i
			@new_quantity_tool = @quantity_t + 1
		end
		@new_quantity_t = @new_quantity_tool.to_s
		@tool.update({quantity: @new_quantity_t})
		@lend_tools = LendTool.find(@tool_id)
		@lend_tools.destroy
		#redirect_to lends_url
		redirect_to @lend
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

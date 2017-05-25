class LendsController < ApplicationController

    before_action :get_tools
  #  before_action :get_students

  def find_student

    if @bandera
      @student_tag = @lends.uid
      arreglo = [@student_tag]
      @student_name = Student.where('taguid = ?', @student_tag).select("name")
      @student_name.each do |student|
        @name = student.name
        puts @name
        @bandera = false
        return @name
      end
    else
      @student_code = params[:lend][:uid]
      @student_name = Student.where('code = ?', @student_code).select("name")
      @student_ide = Student.where('code = ?', @student_code)
      @student_ide.each do |student|
        puts student.id
        puts student.name
        puts "con code-----"
        #puts @name
        #return @name
      end

      puts "Hola"

      #puts session[:prueba]

      @student_ide.update({taguid:session[:prueba]})
      puts "Hola 2"
      redirect_to @lend
    end
    #



    #redirect_to @lend
  end

      def tag
        #ban = true
        puts "entro"

        port_str = "/dev/ttyACM0"  #may be different for you
        baud_rate = 115200
        data_bits = 8
        stop_bits = 1
        parity = SerialPort::NONE

        sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
      #  while ban do
          while (i = sp.gets.chomp) do
            i.slice!("Tag is not NDEF formatted.")
            tagUID = i
            puts "el while"
            puts tagUID
            if tagUID.empty?
               ban= true
            else
              session[:prueba] = tagUID
              return tagUID
            end



          end
        #end
      #sp.closes
      end


    def index
      @frecuentes = ["Kit electrónica", "Cautín", "Pinza", "Pela cable", "Corta frío", "Multímetro",
                      "Kit lego", "Destornillador", "Fuente", "Flexómetro", "Hexágonas", "Pie de rey"]


      @lends = Lend.all
      @lends = Lend.new
      @lends.uid = tag

      if @lends.uid
        @prueba = [@lends.uid]
        puts @prueba
        @bandera = true
        @name = find_student
      else
        @name = "Digitar código"
      end

      #@lends = Lend.search(params[:search])
    end
    def show

    end

    def save_tool (tool_id)
      @lends.tool_id = tool_id
      #@lends.student_id = student_id
      @lends.save
    end

    def create
        @lend = current_student.lends.new(lend_params)
        @lend.save
        redirect_to @lend
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

      #@lends.uid = uid

=begin
      respond_to do |format|
        if @lends.save
          puts "Guardo"
        else
          puts "No guardo"
        end
      end
=end
=begin
    #  @students = @students.where("name = ?", "%#{params[:uid]}%")
      @students = @students.find_by(taguid: :uid)
      puts "----------estudiante -----------"
      #@students.each do |student|
      #  puts "Es #{student}"
      #end
      puts @students
      puts "-----------fin -------------"
      @lends = Lend.new(lend_params)
      #@lends.students = params[:students]
      #@lends.each do |p|
      #  puts p.uid
      #end
      @lends.save
      redirect_to control_url
=end
    #end



    private
    def lend_params
      params.require(:lend).permit(:uid)
    end
    def get_tools
      @tools = Tool.all
    end
    #def get_students
    #  @students = Student.all
    #end

    #def show
      #@students = @students.where("uid ILIKE ?", "%#{params[:taguid]}%")
      #@pro = @tools.title
    #end
end

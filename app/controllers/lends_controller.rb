class LendsController < ApplicationController

    before_action :get_tools
    before_action :get_students

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
      #@lends.uid = tag
      #@lends = Lend.search(params[:search])
    end
    def create
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
    end



    private
    def lend_params
      params.require(:lend).permit(:uid, :student_id, :tool_id)
    end
    def get_tools
      @tools = Tool.all
    end
    def get_students
      @students = Student.all
    end

    def show
      @students = @students.where("uid ILIKE ?", "%#{params[:taguid]}%")
      #@pro = @tools.title
    end



end
class LendToolsController < ApplicationController
	def add
    puts "holaaa"
    hol = params[:name]
    puts hol
    @tooll = params[:title]
    puts @tooll
    if params[:Hola]
      puts "entrar al if"
      puts params[:name]

    end
    puts "holi "
    redirect_to lends_url
    return "hola"
  end 
end

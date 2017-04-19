class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_tools

  private
  def set_tools
    @tools = Tool.all
  end
end

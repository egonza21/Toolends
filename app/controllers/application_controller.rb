class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_tools
  before_action :configure_permitted_parameters, if: :devise_controller?




   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cel, :code])
   end

  private
  def set_tools
    @tools = Tool.all
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [:landing]
  layout :layout_by_resource


  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    elsif action_name == "landing"
      "landing"
      else
        "application"
    end
  end

end

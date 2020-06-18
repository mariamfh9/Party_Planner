class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, prepend: true
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
  
    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || root_path
    end
  
end

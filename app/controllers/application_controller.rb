class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render(*args)
    redirect_errors if controller_name == 'registrations' && action_name == 'create'
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) <<
        [:name, :user_type, :class_name, :qq, :tel, { department: [] }, { photo_equipment: [] },
         { post_software: [] }, { pub_skill: [] }, { film_post: [] }, { film_equipment: [] },
         { hp_direction: [] }, { hp_tech: [] }]
  end

  # Redirect checkbox errors to flash messages
  def redirect_errors
    message = "请检查您的表单是否已经填写完整"
    flash.now[:alert] = [] if flash.now[:alert].nil?
    flash.now[:alert] = [flash.now[:alert]] unless flash.now[:alert].is_a?(Array)
    return if flash.now[:alert].include? message
    fields = [:department, :photo_equipment, :post_software, :post_software,
              :pub_skill, :film_post, :film_equipment, :hp_direction, :hp_tech]
    flash.now[:alert] << message if self.resource.errors.keys.collect { |x| fields.include? x }.inject(:|)
  end
end

class Api::ApiApplicationController < ActionController::API
  before_action :authenticate_user!, unless: -> { Rails.env.test? }

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end

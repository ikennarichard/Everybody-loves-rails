class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def sign_out_user
    sign_out current_user
    redirect_to root_path
  end

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end
end

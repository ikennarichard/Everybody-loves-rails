class UsersController < ApplicationController
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def index
    @users = User.all
    flash[:notice] = 'You have successfully logged in.'
    # if !user_signed_in?
    #   redirect_to new_user_registration_path
    # else
    #   @users = User.all
    #   flash[:notice] = "You have successfully logged in."
    # end
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'errors/not_found', status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end
end

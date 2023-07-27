class UsersController < ApplicationController
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
end

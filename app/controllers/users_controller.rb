class UsersController < ApplicationController
  skip_before_action :require_valid_user!
  before_action :reset_session
  respond_to :html, :json

  def new
    @user = User.new
    respond_modal_with @user
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      flash[:success] =  'You have successfully created an account!'
      respond_modal_with @user, location: root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :login, :password, :password_confirmation, :avatar)
  end
 
end

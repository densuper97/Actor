class DashboardController < ApplicationController
  before_action :current_user

  def index
  end

  def login
    @manager = Manager.where(user_id: @user.id).first
    if @manager
      redirect_to managers_index_path
    else
      redirect_to actors_index_path
    end
  end

  #need to change authentication logic 
  def require_valid_user!
    return true
  end
end

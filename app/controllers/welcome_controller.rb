class WelcomeController < ApplicationController
  def index
    @user = current_user
  end

  #need to change authentication logic 
  def require_valid_user!
    return true
  end

  def test
    respond_to do |format|
      format.html
      format.js
    end
  end
end

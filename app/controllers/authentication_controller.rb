class AuthenticationController < ApplicationController
  def create
    user.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Login Unsuccessfull' }, status: :unauthrized
    end
  def show
     
  end
end

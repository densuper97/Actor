class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_valid_user!

  def current_user
    if !session[:user_id].blank?
      @user ||= User.find(session[:user_id])
    end
  end

  def require_valid_user!
    if current_user.nil?
      flash[:error] = 'You must be logged in to access that page!'
      redirect_to signin_path
    end
  end

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end
=begin  
  protected
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end
    load_current_user!
    invalid_authentication unless @current_user
  end

  def invalid_authentication
    render json: {error: 'Invalid Request'}, status: :unauthorized
  end

  private
  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    JsonWebToken.decode(token)
  rescue
    nil
  end

  def load_current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
=end  
end

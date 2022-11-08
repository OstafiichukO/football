class ApplicationController < ActionController::Base
  require 'jwt'
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authorize_request 

  def login_params
    params.fetch(:user, {})
  end

  def get_token
    # puts login_params[:email]
    current_user = User.find_by(email: login_params[:email] )
    # puts current_user
    payload = {}
    hmac_secret = Rails.application.credentials.hmac_secret
    iat = Time.now.to_i
    exp = Time.now.to_i + 60
    payload[:iat] = iat
    payload[:exp] = exp
    payload[:email] = current_user.email
    payload[:user_id] = current_user.id
    token = JWT.encode payload, hmac_secret, 'HS256'
      respond_to do |format|
        format.xml {render xml: token, status: 404}
        format.json {render json: {message: 'Token generated', token: token}, status: 404}  
      end
  end

  def not_found
    render json: {error: "not_found"}
  end

  def authorize_request
    hmac_secret = Rails.application.credentials.hmac_secret
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded_token = JWT.decode header, hmac_secret, 'HS256'    
      user_id = decoded_token[0]["user_id"] unless !decoded_token
      user = User.find(user_id)
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::ExpiredSignature => e
      render json: { errors: e.message }, status: :unauthorized  
    end
  end
end

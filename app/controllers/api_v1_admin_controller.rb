class ApiV1AdminController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :require_admin_login

  def encode_token(payload)
    JWT.encode(payload, 'my_secret')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        []
      end
    end
  end

  def session_admin_user
    decoded_hash = decoded_token
    if decoded_hash && !decoded_hash.empty?
      admin_user_id = decoded_hash[0]['admin_user_id']
      @admin_user = AdminUser.find_by(id: admin_user_id)
    else
      nil
    end
  end

  def logged_in?
    !!session_admin_user
  end

  def require_admin_login
    render json: {message: 'Please Login as an Admin'}, status: :unauthorized unless logged_in?
  end
end

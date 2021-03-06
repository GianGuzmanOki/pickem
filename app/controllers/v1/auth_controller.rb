module V1
  class AuthController < ApiV1Controller
    skip_before_action :require_login, only: [:login, :auto_login]
    def login
      user = User.find_by(email: params[:email])
      if user && user.valid_password?(params[:password])
          payload = { user_id: user.id }
          token = encode_token(payload)
          render json: { user: user, jwt: token }
      else
          render json: {failure: "Log in failed! Email or password invalid!"}
      end
    end

    def auto_login
      if session_user
        render json: session_user
      else
        render json: {errors: "No User Logged In"}
      end
    end

    def user_is_authed
      render json: {message: "You are authorized"}
    end
  end
end

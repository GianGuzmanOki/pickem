module Admin
  module V1
    class AuthController < ApiV1AdminController
      skip_before_action :require_admin_login, only: [:login, :auto_login]
      def login
        admin_user = AdminUser.find_by(email: params[:email])
        if admin_user && admin_user.valid_password?(params[:password])
            payload = { admin_user_id: admin_user.id }
            token = encode_token(payload)
            render json: { admin_user: admin_user, jwt: token }
        else
            render json: {failure: "Log in failed! Email or password invalid!"}
        end
      end

      def auto_login
        if session_admin_user
          render json: session_admin_user
        else
          render json: {errors: "No User Logged In"}
        end
      end

      def admin_user_is_authed
        render json: {message: "You are authorized"}
      end
    end
  end
end

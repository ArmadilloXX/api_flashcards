require "rails-api"
require "active_model_serializers"

module ApiFlashcards
  class ApiController < ActionController::API
    include ActionController::Serialization
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    before_action :authenticate

    private

    def authenticate
      authenticate_basic_auth || render_not_authenticated
    end

    def authenticate_basic_auth
      authenticate_with_http_basic do |email, password|
        if ApiFlashcards.user_class.authenticate(email, password)
          set_current_user(email)
        end
      end
    end

    def render_not_authenticated
      headers["WWW-Authenticate"] = "Basic realm='API'"
      render json: { message: "Not authorized" }, status: 401
    end

    def current_user
      @current_user
    end

    def set_current_user(email)
      @current_user = User.where(email: email).first
    end
  end
end

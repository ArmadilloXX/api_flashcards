require "rails-api/action_controller/api"

module ApiFlashcards
  class ApplicationController < ActionController::API
    include ActionController::RespondWith
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    self.responder = ApplicationResponder
    respond_to :json
    before_action :authenticate

    protected

    def authenticate
      authenticate_basic_auth || render_not_authenticated
      # if authenticate_basic_auth
      #   set_current_user
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
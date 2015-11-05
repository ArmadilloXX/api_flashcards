module ApiFlashcards
  class ApplicationController < ActionController::Base
    before_action :authenticate

    protected

    def authenticate
      authenticate_basic_auth || render_not_authenticated
    end

    def authenticate_basic_auth
      authenticate_with_http_basic do |email, password|
        ApiFlashcards.user_class.authenticate(email, password)
      end
    end

    def render_not_authenticated
      headers["WWW-Authenticate"] = "Basic realm='API'"
      respond_to do |format|
        format.html { render plain: "Bad credentials", status: 401 }
        format.json { render json: "Bad credentials", status: 401 }
      end
    end
  end
end

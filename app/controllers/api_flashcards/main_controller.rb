require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class MainController < ApplicationController
    include ActionController::MimeResponds
    # respond_to :json

    def welcome
      render json: "OK", status: 200
    end
  end
end

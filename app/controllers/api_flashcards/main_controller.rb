require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class MainController < ApplicationController
    respond_to :json
    def welcome
      render json: { message: "Welcome to MainController" }, status: 200 
    end
  end
end

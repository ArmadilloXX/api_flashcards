require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class MainController < ApplicationController
    def welcome
      render json: { message: "Welcome to MainController" }, status: 200
    end
  end
end

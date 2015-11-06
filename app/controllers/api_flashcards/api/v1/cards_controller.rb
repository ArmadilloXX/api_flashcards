require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class Api::V1::CardsController < ApplicationController
    def index
      render json: { message: "Cards list will be here" }, status: 200
    end

    def create
    end
  end
end

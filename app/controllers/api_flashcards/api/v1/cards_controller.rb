require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class Api::V1::CardsController < ApplicationController
    def index
      @cards = current_user.cards.all.order("review_date")
      render json: @cards
    end

    def create
    end
  end
end

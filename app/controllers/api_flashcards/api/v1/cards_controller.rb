require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class Api::V1::CardsController < ApplicationController
    def index
      @cards = current_user.cards.all.order("review_date")
      render json: @cards, each_serializer: CardSerializer
    end

    def create
    end
  end
end

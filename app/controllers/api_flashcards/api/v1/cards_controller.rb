require_dependency "api_flashcards/application_controller"

module ApiFlashcards
  class Api::V1::CardsController < ApiController

    swagger_controller :cards, "Cards Management"

    swagger_api :index do
      summary "Fetches all User cards"
      notes "This lists all the user's cards"
      response :unauthorized
      # response :not_acceptable, "The request you made is not acceptable"
      # response :requested_range_not_satisfiable
    end

    def index
      @cards = current_user.cards.all.order("review_date")
      render json: @cards, each_serializer: CardSerializer
    end

    def create
      @card = current_user.cards.build(card_params)
      if @card.save
        render json: @card, serializer: CardSerializer, status: 201
      else
        render json: { result: "Can't save your card", errors: "#{@card.errors.full_messages}" }, status: 422
      end
    end

    private

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :block_id)
    end
  end
end

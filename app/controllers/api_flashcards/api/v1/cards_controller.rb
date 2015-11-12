require "swagger/blocks"

module ApiFlashcards
  class Api::V1::CardsController < ApiController
    include Swagger::Blocks

    swagger_path "/cards" do
      operation :get do
        key :description, "Returns all user cards"
        key :produces, ["application/json"]
        key :tags, ["Cards"]

        response 200 do
          key :description, "Response with array of cards"
          schema do
            key :"$ref", :CardsResponse
          end
        end

        response 401 do
          key :description, "Not Authorized"
          schema do
            key :"$ref", :NotAuthorized
          end
        end
      end

      operation :post do
        key :description, "Creates a new card.  Duplicates are allowed"
        key :produces, ["application/json"]
        key :tags, ["Cards"]

        parameter do
          key :name, "card[original_text]"
          key :in, "query"
          key :description, "Original text"
          key :required, true
          key :type, :string
        end

        parameter do
          key :name, "card[translated_text]"
          key :in, "query"
          key :description, "Translated text"
          key :required, true
          key :type, :string
        end

        parameter do
          key :name, "card[block_id]"
          key :in, "query"
          key :description, "Block for card"
          key :required, true
          key :type, :integer
        end

        response 201 do
          key :description, "Response with card"
          schema do
            key :"$ref", :CardResponse
          end
        end

        response 401 do
          key :description, "Not Authorized"
          schema do
            key :"$ref", :NotAuthorized
          end
        end

        response 422 do
          key :description, "Unprocessable entity"
          schema do
            key :"$ref", :Unprocessable
          end
        end
      end
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
        render json: { message: "Can\'t save your card",
          errors: "#{@card.errors.full_messages}" }, status: 422
      end
    end

    private

    def card_params
      params.require(:card).permit(:original_text,
                                   :translated_text,
                                   :block_id)
    end
  end
end

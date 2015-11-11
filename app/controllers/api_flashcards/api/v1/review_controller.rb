module ApiFlashcards
  class Api::V1::ReviewController < ApiController
    include Swagger::Blocks

    swagger_path "/review" do
      operation :get do
        key :description, "Returns one card for review"
        key :produces, ["application/json"]
        key :tags, ["Review"]

        response 200 do
          key :description, "Response with card for review"
          schema do
            key :"$ref", :CardReviewResponse
          end
        end

        response 401 do
          key :description, "Not Authorized"
          schema do
            key :"$ref", :NotAuthorized
          end
        end
      end

      operation :put do
        key :description, "Check card\'s translation"
        key :produces, ["application/json"]
        key :tags, ["Review"]

        parameter do
          key :name, "card_id"
          key :in, "query"
          key :description, "Card ID"
          key :required, true
          key :type, :integer
        end

        parameter do
          key :name, "translated_text"
          key :in, "query"
          key :description, "Translated text"
          key :required, true
          key :type, :string
        end

        response 200 do
          key :description, "Response with card review result"
          schema do
            key :"$ref", :CardReviewResult
          end
        end

        response 401 do
          key :description, "Not Authorized"
          schema do
            key :"$ref", :NotAuthorized
          end
        end
      end
    end

    def index
      if params[:id]
        @card = current_user.cards.find(params[:id])
      else
        @card = current_user.cards_for_review.first
      end
      render json: @card, serializer: CardReviewSerializer
    end

    def check
      @card = current_user.cards.find(review_params[:card_id])
      check_result = @card.check_translation(review_params[:translated_text])
      if check_result[:state]
        prepare_response(check_result[:distance])
      else
        render json: { result: "Your answer is incorrect" }, status: 200
      end
    end

    private

    def review_params
      params.permit(:card_id, :translated_text)
    end

    def prepare_response(distance)
      if distance == 0
        render json: { result: "Your answer is correct" }, status: 200
      else
        render json: { result: "You\'ve made a typo. Correct answer is #{@card.translated_text}" }, status: 200
      end
    end 
  end
end
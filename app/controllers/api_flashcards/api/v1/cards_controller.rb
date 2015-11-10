module ApiFlashcards
  class Api::V1::CardsController < ApiController
    include Swagger::Blocks

    swagger_path '/cards' do
      operation :get do
        key :description, 'Returns all user cards'
        key :operationId, 'findCards'
        key :produces, [
          'application/json'
        ]
        key :tags, [
          'card'
        ]
        # parameter do
        #   key :name, :tags
        #   key :in, :query
        #   key :description, 'tags to filter by'
        #   key :required, false
        #   key :type, :array
        #   items do
        #     key :type, :string
        #   end
        #   key :collectionFormat, :csv
        # end
        # parameter do
        #   key :name, :limit
        #   key :in, :query
        #   key :description, 'maximum number of results to return'
        #   key :required, false
        #   key :type, :integer
        #   key :format, :int32
        # end
        response 200 do
          key :description, 'pet response'
          schema do
            key :type, :array
            items do
              key :'$ref', :Card
            end
          end
        end
        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      end
      # operation :post do
      #   key :description, 'Creates a new pet in the store.  Duplicates are allowed'
      #   key :operationId, 'addPet'
      #   key :produces, [
      #     'application/json'
      #   ]
      #   key :tags, [
      #     'pet'
      #   ]
      #   parameter do
      #     key :name, :pet
      #     key :in, :body
      #     key :description, 'Pet to add to the store'
      #     key :required, true
      #     schema do
      #       key :'$ref', :PetInput
      #     end
      #   end
      #   response 200 do
      #     key :description, 'pet response'
      #     schema do
      #       key :'$ref', :Pet
      #     end
      #   end
      #   response :default do
      #     key :description, 'unexpected error'
      #     schema do
      #       key :'$ref', :ErrorModel
      #     end
      #   end
      # end
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

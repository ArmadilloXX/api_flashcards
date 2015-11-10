require "swagger/blocks"
module ApiFlashcards
  class MainController < ActionController::Base
    include Swagger::Blocks
      swagger_root do
        key :swagger, '2.0'
        info do
          key :version, '1.0.0'
          key :title, 'Flashcards API'
          key :description, 'A sample API for Flashcards App'
          # license do
          #   key :name, 'MIT'
          # end
        end
        tag do
          key :name, 'Cards'
          key :description, 'Cards operations'
          # externalDocs do
          #   key :description, 'Find more info here'
          #   key :url, 'https://swagger.io'
          # end
        end
        key :host, 'localhost:3000'
        key :basePath, '/api/v1'
        key :consumes, ['application/json']
        key :produces, ['application/json']
      end

      # A list of all classes that have swagger_* declarations.
      SWAGGERED_CLASSES = [
        Api::V1::CardsController,
        ::Card,
        # ErrorModel,
        self,
      ].freeze

      # swagger_data = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      # File.open('localhost:3000/public/api/v1/swagger.json', 'w') { |file| file.write(swagger_data.to_json) }

      def welcome
        render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
      end
  end
end

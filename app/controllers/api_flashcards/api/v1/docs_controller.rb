require "swagger/blocks"
require "swagger-ui_rails"

module ApiFlashcards
  module Api
    module V1
      # class DocsController < ApiController
      class DocsController < ActionController::Base
        include Swagger::Blocks
        def welcome
          render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
        end
        def index
        end
      end
    end
  end
end

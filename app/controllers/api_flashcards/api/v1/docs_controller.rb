require "swagger/blocks"

module ApiFlashcards
  module Api
    module V1
      class DocsController < ActionController::Base
        include Swagger::Blocks
        def welcome
          render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
        end
      end
    end
  end
end

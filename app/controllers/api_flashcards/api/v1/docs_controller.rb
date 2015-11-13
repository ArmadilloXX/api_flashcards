require "swagger/blocks"
module ApiFlashcards
  class Api::V1::DocsController < ApiController
    include Swagger::Blocks
    def welcome
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end
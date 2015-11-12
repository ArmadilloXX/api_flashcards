require "swagger/blocks"
module ApiFlashcards
  class MainController < ActionController::Base
    include Swagger::Blocks
    def welcome
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end

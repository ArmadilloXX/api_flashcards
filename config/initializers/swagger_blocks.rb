require "swagger/blocks"

module ApiFlashcards
  include Swagger::Blocks
  host = if ENV["RAILS_ENV"] == "production"
    "mkdev-flashcards.herokuapp.com"
  else
    "localhost:3000"
  end
  swagger_root do
    key :swagger, "2.0"
    info do
      key :version, "1.0.0"
      key :title, "Flashcards API"
      key :description, "A sample API for Flashcards App"
    end
    tag do
      key :name, "Cards"
    end
    tag do
      key :name, "Review"
    end
    key :host, host
    key :basePath, "/api/v1"
    key :produces, ["application/json"]
  end

  SWAGGERED_CLASSES = [
    Api::V1::CardsController,
    Api::V1::ReviewController,
    Api::V1::CardModel,
    Api::V1::ErrorModel,
    self,
  ].freeze

  # Prepares and writes json for Swagger-UI(swagger_engine gem)
  swagger_data = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  File.open(Rails.root.to_s + "/lib/swagger/v1/docs.json", "w") do |file|
    file.write(swagger_data.to_json)
  end
end

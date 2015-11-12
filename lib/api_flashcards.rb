# Gem.loaded_specs["api_flashcards"].dependencies.each do |d|
#  require d.name
# end
# require "swagger_engine"
require "api_flashcards/engine"

module ApiFlashcards
  mattr_accessor :user_class

  def self.user_class
    @@user_class.constantize
  end
end

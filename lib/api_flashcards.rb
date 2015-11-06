require "api_flashcards/engine"
require "responders"
require "application_responder"

module ApiFlashcards
  mattr_accessor :user_class

  def self.user_class
    @@user_class.constantize
  end
end

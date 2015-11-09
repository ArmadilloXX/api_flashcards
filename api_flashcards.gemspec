$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "api_flashcards/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "api_flashcards"
  s.version     = ApiFlashcards::VERSION
  s.authors     = ["Ilya Dolgirev"]
  s.email       = ["ilya.dolgirev@gmail.com"]
  s.homepage    = "http://www.mkdev.me"
  s.summary     = "Summary of ApiFlashcards."
  s.description = "API for Flashcards app"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "rails-api"
  s.add_dependency "responders"
  # s.add_dependency "active_model_serializers"
  s.add_dependency "swagger-docs"
  s.add_dependency "swagger-ui_rails", '2.1.0-alpha.7.1'

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "bcrypt"
end

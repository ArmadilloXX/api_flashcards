module ApiFlashcards
  class Engine < ::Rails::Engine
    isolate_namespace ApiFlashcards

    config.generators do |g|
      g.test_framework :rspec, fixture: false, view_specs: false
      g.assets false
      g.helper false
    end
  end
end

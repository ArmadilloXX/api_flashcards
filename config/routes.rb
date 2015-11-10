ApiFlashcards::Engine.routes.draw do
  get "main/welcome", to: "main#welcome"
  scope module: "api" do
    namespace "v1" do
      get "cards", to: "cards#index"
      post "cards", to: "cards#create"
    end
  end
  root to: "main#welcome"
  # mount SwaggerEngine::Engine, at: "/docs"
  
end

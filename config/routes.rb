ApiFlashcards::Engine.routes.draw do
  scope module: "api" do
    namespace "v1" do
      get "cards", to: "cards#index"
      post "cards", to: "cards#create"
      get "review", to: "review#index"
      put "review", to: "review#check"
    end
  end
  get "main/welcome", to: "main#welcome"
  root to: "main#welcome"
end

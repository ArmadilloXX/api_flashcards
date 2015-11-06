ApiFlashcards::Engine.routes.draw do
  get "main/welcome"
  root to: "main#welcome"

    scope module: "api" do
      namespace "v1" do
        get "cards", to: "cards#index"
      end
    end
end

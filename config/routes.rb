ApiFlashcards::Engine.routes.draw do
  scope module: "api" do
    namespace "v1" do
      get "cards", to: "cards#index"
      post "cards", to: "cards#create"
      get "review", to: "review#index"
      put "review", to: "review#check"
      get "/", to: "docs#welcome"
      # get "docs", to: "docs#index"
    end
  end
end

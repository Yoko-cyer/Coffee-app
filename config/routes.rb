Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index" # homepage
  get "/coffee", to: "coffee#index"
  get "/coffee/:id", to: "coffee#show"
end

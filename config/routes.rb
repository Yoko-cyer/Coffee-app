Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index" # homepage
  get "/coffee", to: "coffee#index"
  post "/coffee", to: "coffee#create"

  get "/coffee/:id", to: "coffee#show"
  put "/coffee/:id", to: "coffee#update"

  # get "/contact", to: "coffee#contact"
end

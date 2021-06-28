Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "pages#index" # homepage
  get "/coffee", to: "coffee#index"
  post "/coffee", to: "coffee#create", as: "create_coffee"
  get "/coffee/new", to: "coffee#new"
  get "/coffee/:id/edit", to: "coffee#edit", as: "edit_coffee"  

  get "/coffee/:id", to: "coffee#show", as: "show_coffee"
  put "/coffee/:id", to: "coffee#update", as: "update_coffee"
  delete "/coffee/:id", to: "coffee#destroy"

  # get "/contact", to: "coffee#contact"
end

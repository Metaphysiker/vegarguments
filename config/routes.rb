Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  root 'static_pages#welcome'

  get '/adminpanel', to: 'arguments#adminpanel'

  post "/arguments/publishargument/:id", to: 'arguments#publishargument', as: 'publish_argument'

  post "/arguments/submitsuggestion/:id", to: 'arguments#submitsuggestion', as: 'submit_suggestion'

  post "/arguments/search", to: 'arguments#search'
  resources :arguments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

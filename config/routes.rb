Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  root 'static_pages#welcome'

  get '/adminpanel', to: 'arguments#adminpanel'

  post "/arguments/publishargument/:id", to: 'arguments#publishargument', as: 'publish_argument'
  post "/questions/publishquestion/:id", to: 'questions#publishquestion', as: 'publish_question'

  post "/arguments/submitsuggestion/:id", to: 'arguments#submitsuggestion', as: 'submit_suggestion'

  post "/arguments/search", to: 'arguments#search'

  get '/visits', to: 'static_pages#visits'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  get '/contribute', to: 'static_pages#contribute', as: 'contribute'
  get '/overview', to: 'static_pages#overview', as: 'overview'

  resources :questions
  resources :arguments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

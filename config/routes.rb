Rails.application.routes.draw do
  devise_for :users
  devise_for :models

  scope "(:locale)", locale: /en|de|fr/ do
    root 'static_pages#welcome'

    resources :questions
    resources :arguments
    get '/adminpanel', to: 'arguments#adminpanel'
    get '/visits', to: 'static_pages#visits'
    get '/contact', to: 'static_pages#contact', as: 'contact'
    get '/contribute', to: 'static_pages#contribute', as: 'contribute'
    get '/use', to: 'static_pages#use', as: 'use'
    get '/overview', to: 'static_pages#overview', as: 'overview'
    get '/impressum', to: 'static_pages#impressum', as: 'impressum'
  end



  post "/arguments/publishargument/:id", to: 'arguments#publishargument', as: 'publish_argument'
  post "/questions/publishquestion/:id", to: 'questions#publishquestion', as: 'publish_question'

  post "/arguments/submitsuggestion/:id", to: 'arguments#submitsuggestion', as: 'submit_suggestion'

  post "/arguments/search", to: 'arguments#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

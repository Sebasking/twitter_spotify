Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/zaps', to: 'zapier_webhook#recieveWebHook'
  get '/spotify_auth', to: 'spotify#authorize'


  resources :spotify, only: [:create, :new]
  resources :breakthrough, only: [:index]
  resources :tracks, only: [:create]
  mount ActionCable.server => '/cable'
end

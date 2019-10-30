Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tracks', to: 'track_listing#show'
  post '/zaps', to: 'zapier_webhook#recieveWebHook'
end

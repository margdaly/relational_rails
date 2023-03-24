Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'
  get '/paints', to: 'paints#index'
  get '/paints/:id', to: 'paints#show'
  get '/artists/:artist_id/paints', to: 'artist_paints#index'
end

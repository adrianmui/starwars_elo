Rails.application.routes.draw do
  root to: 'players#index'

  resources :players
  resources :rankings
  

  get '/rankings' => 'rankings#index'
end

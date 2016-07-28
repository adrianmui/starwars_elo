Rails.application.routes.draw do
  root to: 'players#edit'

  resources :players, :only =>[:index, :new, :edit]
  resources :rankings, :only =>[:index]
  
end

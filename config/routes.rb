Rails.application.routes.draw do
  root to: root_path

  resources :players, :only =>[:index, :new, :edit]
  resources :rankings, :only =>[:index]
  
end

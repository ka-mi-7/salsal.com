Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'recruits#index'
  
  resources :teams, only: [:new, :create] 
  resources :recruits
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users

  root to: 'recruits#index'
  
  resources :teams, only: [:new, :create] 
  resources :recruits
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

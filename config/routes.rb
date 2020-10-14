Rails.application.routes.draw do
  get 'recruits/new'



  root to: 'home#top'
  
  resources :teams, only: [:new, :create] 
  
  get '/recruits/:id'=>'recruits#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

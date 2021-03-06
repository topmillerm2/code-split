Rails.application.routes.draw do

  root :to => 'rooms#index'
  
  resources :vrooms
  match "/party/:id", :to => 'vrooms#party', :as => :party, :via => :get
  
  resources :editors, only: [:show]
  resources :rooms, only: [:index, :create, :destory, :show]


  devise_for :users
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # get 'static_pages/home' # instead will use root
  # can also be done with, root to: 'static_pages#home'
  root 'static_pages#home'
  get '/about', to:'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:index, :show, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

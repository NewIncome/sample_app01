Rails.application.routes.draw do
  root 'static_pages#home'
  # get 'static_pages/home' # instead will use root
  get '/about', to:'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

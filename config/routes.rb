Rails.application.routes.draw do
  root 'users#home'

  get 'users/home' => 'users#home'

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'

  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'

  get 'users/logout' => 'users#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

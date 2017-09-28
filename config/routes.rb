Rails.application.routes.draw do

  root 'users#home'

  get 'users/home' => 'users#home'

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'

  get 'users/login' => 'users#login'
  post 'users/login' => 'users#check'
  delete 'users/login' => 'users#logout'

  get 'advertisements/new' => 'advertisements#new'
  post 'advertisements/new' => 'advertisements#create'

  get 'advertisements' => 'advertisements#index'

  get 'advertisements/:id' => 'advertisements#show'
  patch 'advertisements/:id' => 'advertisements#validate'
  post 'advertisements/:id' => 'comments#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

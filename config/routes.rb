MyApp::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  
  get "sessions/new"
  #match '/microposts/destroy', :controller => 'microposts', :action => 'destroy'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/signup',  :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'

  root :to => 'pages#home'
  get "pages/home"
  get "pages/about"
  get "pages/contact"

  resources :users

  
end

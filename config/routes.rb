MyApp::Application.routes.draw do
  resources :users
  match '/signup',  :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'

  root :to => 'pages#home'
  get "pages/home"
  get "pages/about"
  get "pages/contact"

 
  resources :microposts


  resources :users

  
end

Rails.application.routes.draw do
  resources :abouts
  devise_for :users
  resources :contacts

  resources :conversations do
    resources :messages
  end
  
  root 'pages#home'

  get '/contact' => 'contacts#new'
  get '/messages' => 'contacts#index'
  get '/about' => 'abouts#index'

  get '/dashboard' => 'pages#dashboard'

  root :to => 'site#home'



  get '/upgrade/:id' => 'pages#upgrade'
  get '/downgrade/:id' => 'pages#downgrade'
  get '/allusers' => 'pages#allusers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

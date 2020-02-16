Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  root 'pages#home'

  get '/contact' => 'contacts#new'

  root :to => 'site#home'



  get '/upgrade/:id' => 'pages#upgrade'
  get '/downgrade/:id' => 'pages#downgrade'
  get '/allusers' => 'pages#allusers'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :doubles
  resources :my_games
  resources :game_names
  resources :posts do
    resources :comments
  end
  resources :abouts
  devise_for :users
  resources :contacts

  resources :conversations do
    resources :messages
  end
  #root 'pages#home'
  root :to => 'pages#home'
  get '/user' => "pages#dashboard", :as => :user_root
  
  

  get '/contact' => 'contacts#new'
  get '/messages' => 'contacts#index'
  get '/about' => 'abouts#index'

  get '/dashboard' => 'pages#dashboard'

  



 get '/on/:id' => 'posts#on'
 get '/off/:id' => 'posts#off'


  get '/upgrade/:id' => 'pages#upgrade'
  get '/downgrade/:id' => 'pages#downgrade'
  get '/allusers' => 'pages#allusers'

  get '/mygames' => 'my_games#index'
  get '/confirm/:id' => 'my_games#confirm'

  get '/lb' => 'my_games#leaderboard'
  get '/sod' => 'pages#sod'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

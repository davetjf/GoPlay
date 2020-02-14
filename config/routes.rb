Rails.application.routes.draw do
  resources :contacts
  root 'pages#home'

  get '/contact' => 'contacts#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

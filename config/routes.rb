Rails.application.routes.draw do
  get 'main/index'
  resources :users
  resources :books do
    post 'borrow'
  end
  root to: 'main#index'
  get '/login', to: 'users#log_in', as: :log_in
  post '/sign_in', to: 'users#sign_in', as: :sign_in
  delete '/logout/:user_id', to: 'users#log_out', as: 'log_out'
  post '/return_book', to: 'main#return_book', as: :return_book
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

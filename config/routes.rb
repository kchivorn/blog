Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  resources :posts do
    resources :comments
  end
  root "posts#index"
  get '/about', to: 'pages#about'
end

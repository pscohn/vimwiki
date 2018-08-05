Rails.application.routes.draw do
  root 'landing#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :pages, param: :slug
  #   get 'page/:slug' => 'pages#show'
  #   get 'page/:slug/edit' => 'pages#edit'
  #   post 'page/:slug' => 'pages#create'
  #   put 'page/:slug' => 'pages#update'
  # end

  resources :account_activations, only: [:edit]
  resources :users, except: [:index, :edit], param: :username do
      member do
      end
  end

end

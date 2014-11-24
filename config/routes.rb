Rails.application.routes.draw do
  devise_for :users do
    root to: 'wiki#index', as: :user_root
  end

  resources :wikis
  resource :home, controller: 'home'
  root to: 'home#show'
  resources :charges, only: [:new, :create]

end
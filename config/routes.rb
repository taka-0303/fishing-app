Rails.application.routes.draw do
  root to: 'profiles#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
    }
    
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :fish_names, only: [:create, :show, :edit, :update, :destroy] do
    resources :fish_infos, only: [:new, :create, :edit, :update, :destroy]
  end
end

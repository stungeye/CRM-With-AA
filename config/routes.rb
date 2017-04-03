Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'customers#index'

  resources :customers, only: [:index, :show] do
    member do
      post :remember_to_call # POST /customers/:id/remember_to_call/
    end
  end

  # The above member route is equivalent to manually defining:
  # post 'customers/:id/remember_to_call/' => "customers#remember_to_call", as: 'remember_to_call_customer', id: /\d+/
end

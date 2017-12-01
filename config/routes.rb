Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :user, controllers: {sessions: 'users/sessions'}
  root 'home#index'
  get 'users/sign_in' => 'articles#home'
  resources :products
  resources :articles do
    resources :comments
  end
  resources :welcomes
  resources :users
  resources :pictures

  namespace :api do
    resource :qiniu_notify, only: [:create]
    resource :validation_code, only: [:create] do
      collection do
        post 'to_logged_consumer'
      end
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

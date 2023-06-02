Rails.application.routes.draw do

  resources :questions
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users

  post '/login', to: 'authentication#login'
end

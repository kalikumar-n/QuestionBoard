Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/login', to: 'authentication#login'
  resources :users
  resources :questions
  post '/create_questions_from_csv', to: 'questions#create_questions_from_csv'
end

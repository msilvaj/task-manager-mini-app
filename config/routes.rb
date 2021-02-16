Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  #route to access the report of tasks done. 
  get 'report', to: 'report#index'

  resources :tasks 

  resources :profiles, only: %i[show new create update edit] do
    get 'private_page', on: :member
    post 'change_privacy', on: :member
    resources :comments, only: %i[index]
  end

  resources :pluses, only: %i[create destroy]
  resources :minuses, only: %i[create destroy]
end

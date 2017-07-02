Rails.application.routes.draw do
  devise_for :users

  post 'auth_user' => 'authentication#authenticate_user'

  authenticated do
    root 'home#index'
  end

  root 'guest#index'
end

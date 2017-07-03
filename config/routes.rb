Rails.application.routes.draw do
  devise_for :users

  post 'auth_user' => 'authentication#authenticate_user'

  root 'home#index'

end

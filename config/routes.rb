Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # define devise routes
  devise_for :users, controller: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Defines the root path route ("/")
  # root "articles#index"
end

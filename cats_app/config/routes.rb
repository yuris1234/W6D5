Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'cats#index'
  resources :cats, only: [:create, :index, :show, :update, :new, :edit]
end

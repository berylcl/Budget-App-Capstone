Rails.application.routes.draw do
  devise_for :users
  get 'category/index'
  get 'category/new'
  get 'category/create'
  get 'expense/new'
  get 'expense/index'
  get 'expense/create'
  get 'home/index'
  get 'user/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

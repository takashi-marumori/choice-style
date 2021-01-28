Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:index, :new, :create, :edit, :update]
  get 'posts/search'
  get 'posts/search_index'
  get 'posts/search_result'
end

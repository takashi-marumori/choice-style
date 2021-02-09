Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    collection do
      get 'search'
      get 'search_edit'
      get 'search_edit_result'
      get 'search_show'
      get 'search_show_result'
      get 'search_destroy'
      get 'search_destroy_result'
    end
  end
  resources :users, only: :show

  get 'users', to: 'users#check'
end

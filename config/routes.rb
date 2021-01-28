Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:index, :new, :create, :edit, :update, :show] do
    collection do
      get 'posts/search'
      get 'posts/search_edit'
      get 'posts/search_result'
    end
  end
end

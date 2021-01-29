Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts, only: [:index, :new, :create, :edit, :update, :show] do
    collection do
      get 'search'
      get 'search_edit'
      get 'search_edit_result'
      get 'search_show'
      get 'search_show_result'
    end
  end
end

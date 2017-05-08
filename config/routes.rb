Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts_admin do
    member do
      get :publish
      get :unpublish
    end
  end
  resources :posts, only: [:index, :show]
end

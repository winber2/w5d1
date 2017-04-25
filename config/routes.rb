Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :new, :show, :edit, :update]
  resources :subs
  resources :posts, except: [:index] do
    resources :comments, only: [:create, :destroy, :show, :new]
  end
  resource :session, only: [:create, :new, :destroy]
  resources :likes, only: [:create, :destroy]
end

Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :orders, only: [:show]
  end
  namespace :admin do
    resources :order_detaills, only: [:index, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
  end
   namespace :public do
    resources :addresses, only: [:index, :create, :show, :update, :destroy]
  end
  namespace :public do
    resources :orders, only: [:new, :create, :comfirm, :complete, :index, :show]
  end
  namespace :public do
    resources :cart_items, only: [:index, :create, :update, :destroy]
  end
  namespace :public do
    resources :customers, only: [:show, :edit, :unsubscribe]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

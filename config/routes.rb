Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:index, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get 'homes/top'


  end

  namespace :public do
    delete 'cart_items/all_destroy'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    get 'orders/complete' => "orders#complete"
    post 'orders/comfirm' => "orders#comfirm"
    resources :orders, only: [:new, :create,  :complete, :index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get 'customers/unsubscribe'
    patch '/customers/withdraw' => "customers#withdraw"
    get '/customers/my_page' => "customers#show"
    get '/customers/edit'=>"customers#edit"
    patch '/customers'=>"customers#update"

  end
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

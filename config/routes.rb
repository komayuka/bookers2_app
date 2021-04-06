Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
  post 'followings' =>  'relationships#followings', as: 'followings'
  post 'followers' => 'relationships#unfollowers', as: 'followers'
  end
  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

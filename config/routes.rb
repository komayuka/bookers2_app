Rails.application.routes.draw do
  get 'chats/show'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searchs#search'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'relationships/followers' => 'relationships#followers', as: 'followers'
    get 'relationships/followings' => 'relationships#followings', as: 'followings'
  end
  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

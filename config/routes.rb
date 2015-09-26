Rails.application.routes.draw do

  root to: 'static_pages#home'
  get     'signup', to:'users#new'
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'
  
  resources :users, except: [:index, :new] do 
    get     'followings', on: :member
    get     'followers',  on: :member
    get     :favorites,   on: :member
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts do
    resources :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end

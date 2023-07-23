Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
    devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#new_guest'
    end
     
  # root to: 'homes#top'
  
  namespace :admin do
     get '/' => "homes#top"
     resources :users, only:  [:show, :edit, :update]
  end
  
  scope module: :public do
    
    # root to: "homes#top"
    
    # resources :posts do  #postsコントローラへのルーティング  
    #   resources :comments, only: [:create]  #commentsコントローラへのルーティング
    #   resource :favorites, only: [:create, :destroy]
    # end
   
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    resources :musics, only: [:new, :index,:show,:create,:destroy] do
      resources :albums, only: [:index, :create, :destroy]
      resources :comments, only: [:create, :destroy]  #commentsコントローラへのルーティング
      resource :favorites, only: [:create, :destroy]
    end
     
    get 'users/information/edit' => 'users#edit'                 #顧客の登録情報編集画面.
    patch 'users/information' => 'users#update'                  #顧客の登録情報更新.
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "public/homes#top"
 end


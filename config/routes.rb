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
  end
  
  scope module: :public do
    
    # root to: "homes#top"
    
    # resources :posts do  #postsコントローラへのルーティング  
    #   resources :comments, only: [:create]  #commentsコントローラへのルーティング
    #   resource :favorites, only: [:create, :destroy]
    # end
    
    resources :albums, only: [:index, :destroy]
   
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    resources :musics, only: [:new, :index,:show,:create,:destroy] do
      resources :comments, only: [:create]  #commentsコントローラへのルーティング
      resource :favorites, only: [:create, :destroy]
    end
    
    get 'users/my_page' => 'users#show'                          #顧客のマイページ.
    get 'users/information/edit' => 'users#edit'                 #顧客の登録情報編集画面.
    patch 'users/information' => 'users#update'                  #顧客の登録情報更新.
    patch 'users/withdraw' => 'users#withdraw'        #顧客の退会処理(ステータスの更新).
    
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "public/homes#top"
 end


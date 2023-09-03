Rails.application.routes.draw do
  devise_for :users

  #PostController
  get 'posts/new', to: 'posts#new', as: 'new_post'
  get '/', to: 'posts#index', as: 'index_post'
  post 'posts/new', to: 'posts#create', as: 'create_post'
  get 'posts/edit/:id', to: 'posts#edit', as: 'edit_post'
  post 'posts/edit/:id', to: 'posts#update', as: 'update_post'
  delete 'posts/destroy/:id', to: 'posts#destroy', as: 'destroy_post'
  get 'posts/show/:post_id/comments/new', to: 'comments#new', as: 'new_comment'
  post 'posts/show/:post_id/comments/new', to: 'comments#create', as: 'create_comment'
  #プロフィール登録・更新
  get 'profiles/new',to: 'profiles#new', as: 'new_profiles'
  post 'profiles/new',to: 'profiles#create',as: 'create_profiles'
  
  #プロフィール詳細画面へ
  get 'profiles/show/:user_id',to: 'profiles#show', as: 'show_profile'
  #プロフィール詳細画面でのフォロー
  post 'profiles/show/:user_id',to: 'profiles#follow', as: 'follow_profile' 
  delete 'profiles/destroy/:id',to: 'profiles#destroy', as: 'destroy_profile'

  #プロフィール詳細画面へ
  get 'follows/show/:user_id',to: 'follows#show', as: 'show_follow'
  #プロフィール詳細画面でのフォロー
  post 'follows/show/:user_id',to: 'follows#create', as: 'create_follow'
  #フォローを外す
  delete 'follows/destroy/:id',to: 'follows#destroy', as: 'destroy_follow'


  #通知
  get 'notifications/index',to: 'notifications#index', as: 'index_notifications'
  
  
  
  #削除
  delete 'notifications/destroy', to: 'notifications#destroy_all', as: 'destroy_all_users_notifications'
  

  #TopicsController
  get 'topics/new', to: 'topics#new', as:'new_topics'
  get 'topics/edit', to: 'topics#edit', as:'edit_topics'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

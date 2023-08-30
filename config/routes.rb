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
  #ユーザープロフィール/フォロー時のプロフィール詳細画面
  get 'user_profiles/:user_id', to:'user_profiles#show', as:'show_user_profile'
  #登録・更新
  get 'profiles/new',to: 'profiles#new', as: 'new_profiles'
  post 'profiles/new',to: 'profiles#create',as: 'create_profiles'
  #通知
  get 'notifications/index',to: 'notifications#index', as: 'index_notifications'
  #通知画面から返信のあった投稿へアクセスできるように
  # post 'notifications/new',to: ''
  
  
  #削除
  delete 'notifications/destroy', to: 'notifications#destroy_all', as: 'destroy_all_users_notifications'
  

  #TopicsController
  get 'topics/new', to: 'topics#new', as:'new_topics'
  get 'topics/edit', to: 'topics#edit', as:'edit_topics'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

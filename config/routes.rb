Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  #PostController
  get 'posts/new', to: 'posts#new', as: 'new_post'
  get '/', to: 'posts#index', as: 'index_post'
  post 'posts/new', to: 'posts#create', as: 'create_post'
  get 'posts/edit/:id', to: 'posts#edit', as: 'edit_post'
  post 'posts/edit/:id', to: 'posts#update', as: 'update_post'
  delete 'posts/destroy/:id', to: 'posts#destroy', as: 'destroy_post'
  #コメント
  get 'posts/show/:post_id/comments/new',to: 'comments#new',as: 'new_comment'
  post 'posts/show/:post_id/comments/new', to: 'comments#create', as: 'create_comment'

  #いいね
  post 'posts/:post_id/favorites/create',to: 'comments#favorite',as: 'create_favorite'
  delete 'posts/:post_id/favorites/destroy',to: 'comments#destroy', as: 'destroy_favorite'

  #プロフィール登録・更新
  get 'profiles/new',to: 'profiles#new', as: 'new_profile'
  post 'profiles/new',to: 'profiles#create',as: 'create_profile'

  #プロフィール詳細画面へ
  get 'follows/show/:user_id',to: 'follows#show', as: 'show_follow'
  #プロフィール詳細画面でのフォロー
  post 'follows/show/:user_id',to: 'follows#create', as: 'create_follow'
  #フォローを外す
  delete 'follows/destroy/:id',to: 'follows#destroy', as: 'destroy_follow'

  #通知機能
  get 'notifications/index',to: 'notifications#index',as: 'index_notification'
  #更新
  patch 'notifications/update/:id',to: 'notifications#update',as: 'update_notification'
  #削除
  delete 'notifications/mark_all_as_read', to: 'notifications#mark_all_as_read', as: 'mark_all_as_read_notification'

  #通報機能
  post 'posts/:post_id/reports/create',to: 'reports#create',as: 'create_post_report'
  post 'comments/:comment_id/reports/create',to: 'reports#create',as: 'create_comment_report'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

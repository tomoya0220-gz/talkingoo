Rails.application.routes.draw do
  devise_for :users

  #PostController
  get 'posts/new', to: 'posts#new', as: 'new_post'
  get '/', to: 'posts#index', as: 'index_post'
  post 'posts/new', to: 'posts#create', as: 'create_post'

  #TopicsController
  get 'topics/new', to: 'topics#new', as:'new_topics'
  get 'topics/edit', to: 'topics#edit', as:'edit_topics'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

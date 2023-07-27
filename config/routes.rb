Rails.application.routes.draw do
  devise_for :user
  root 'users#index'
  get '/users/', to: 'users#index'
  get '/users/:id', to: 'users#show', as: "user_show"
  
  get '/users/:user_id/posts', to: 'posts#index', as: 'postindex'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/:user_id/posts/create', to: 'posts#create', as: 'create_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'posts'

  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as:'new_comment'
  post '/users/:user_id/posts/:id/comments/create', to: 'comments#create', as:'post_comment'
  
  post '/users/:user_id/posts/:id/likes/create', to: 'likes#create', as: 'like_post'
end

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/users/', to: 'users#index'
  get '/users/:id', to: 'users#show', as: "user_show"
  
  get '/users/:user_id/posts', to: 'posts#index', as: 'postindex'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/:user_id/posts/create', to: 'posts#create', as: 'create_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'posts'
  delete '/users/:user_id/posts/:id/delete', to: 'posts#destroy', as: :posts_delete


  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as:'new_comment'
  post '/users/:user_id/posts/:id/comments/create', to: 'comments#create', as:'post_comment'
  delete '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy', as: :comments_delete
  
  post '/users/:user_id/posts/:id/likes/create', to: 'likes#create', as: 'like_post'
  
  get '/users/:id/sign_out', to: 'application#sign_out_user', as: 'sign_out_user'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end

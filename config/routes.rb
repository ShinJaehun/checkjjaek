Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'posts#index'
  resources :posts do
    post 'like', to: 'posts#like', as: :like, on: :member
    # member를 붙이지 않으면 : posts/:post_id/like 
    # member를 붙이면… : posts/:id/like 
    # 둘 다 post의 ID를 의미하지만 
    # post controller에서 set_post 메서드를 통해 post를 받아올 때 id 값을 이용하고 있다. 그래서 id를 쓰는 것이 맞음...
    # as는 주소의 별칭... 
    # like_post_path라는 별칭이 생긴다...
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only:[:show] do
    post 'follow', to: 'users#follow', as: :follow, on: :member
  end
  
  # 책 검색
  get 'search', to: 'posts#search'

  #해쉬태그 관련
  get '/posts/hashtag/:name', to: 'posts#hashtags'
  
  # 특정 책과 관련된 post 보여주기
  get '/books/:id', to: 'books#show', as: 'book'
end

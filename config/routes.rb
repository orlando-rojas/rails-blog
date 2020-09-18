Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'articles', to: 'articles#index'
  get 'articles/new', to: 'articles#new', as: :new_article
  get 'articles/:id', to: 'articles#show'
  get 'articles/:id/edit', to: 'articles#edit'
  get 'articles/user/:id', to: 'articles#from_author'

  patch 'articles/:id', to: 'articles#update', as: :article
  post 'articles', to: 'articles#create'
  delete 'articles/:id', to: 'articles#destroy'
end

Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: 'home#index'

  get 'articles/my_articles', to: 'articles#my_articles', as: :my_articles
  resources :articles do
    get 'user/:id', to: 'articles#from_author', on: :collection
  end

  # get 'articles', to: 'articles#index'
  # get 'articles/new', to: 'articles#new', as: :new_article
  # get 'articles/:id', to: 'articles#show'
  # get 'articles/:id/edit', to: 'articles#edit', as: :edit_article
  # patch 'articles/:id', to: 'articles#update', as: :article
  # post 'articles', to: 'articles#create'
  # delete 'articles/:id', to: 'articles#destroy'
end

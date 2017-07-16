Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  resources :mixes, :path => 'collection' do
    resources :songs, :path => 'mixtape'
  end


  authenticated :user do
    root to: 'mixes#index', as: :authenticated_root
  end
  root to: 'welcome#index'
end

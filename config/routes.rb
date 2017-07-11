Rails.application.routes.draw do
  resources :mixes, :path => 'collection' do
    resources :songs, :path => 'mixtape'
  end
  root to: 'mixes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

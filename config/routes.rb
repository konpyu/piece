Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  resource  :user,  only: [:update]
  resources :posts, only: [:new, :create, :destroy]
  #match '*path' => 'application#error404', via: :all
end

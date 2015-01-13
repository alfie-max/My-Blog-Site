Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth"}

  root 'blog_home#home'
  get '/about'   => 'blog_home#about'
  # get '/soemthig', to: 'controllers#actions', as: 'soemthig'
  get '/contact' => 'blog_home#contact'

  # get '/auth/:provider/callback' => 'sessions#create'

  resources :blogpost
end

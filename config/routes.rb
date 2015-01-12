Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth"}

  root 'blog_home#home'
  get '/about'   => 'blog_home#about'
  get '/contact' => 'blog_home#contact'

  get "/auth/:provider/callback" => "sessions#create"
end

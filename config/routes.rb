Rails.application.routes.draw do
  devise_for :users

  root 'blog_home#home'
  get '/about'   => 'blog_home#about'
  get '/contact' => 'blog_home#contact'

end

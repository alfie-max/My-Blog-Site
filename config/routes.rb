Rails.application.routes.draw do
  root 'blog_home#home'
  get 'about'   => 'blog_home#about'
  get 'contact' => 'blog_home#contact'
  get 'signup'  => 'blog_home#home'
end

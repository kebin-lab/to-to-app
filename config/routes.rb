Rails.application.routes.draw do

  get "/" => "home#top"
  get "home/about" => "home#about"

  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get 'users/index' => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"

  post "tasks/create" => "tasks#create"
  get "tasks/new" => "tasks#new"
  post "tasks/:id/destroy" => "tasks#destroy"
  post "tasks/:id/update" => "tasks#update"
  get "tasks/:id/edit" => "tasks#edit"
  get 'tasks/index' => "tasks#index"
  get "tasks/:id" => "tasks#show"
  
  post "posts/create" => "posts#create"
  get "posts/new" => "posts#new"
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/update" => "posts#update"
  get "posts/:id/edit" => "posts#edit"
  get 'posts/index' => "posts#index"
  get "posts/:id" => "posts#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

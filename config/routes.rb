Rails.application.routes.draw do

get "todos/index"
root "homes#top"
resources :users, only: [:new, :create, :show]

end

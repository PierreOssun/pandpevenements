Rails.application.routes.draw do


  get 'events/new'

  get 'events/create'

  get 'events/show'

root 'static_pages#home', as: 'home'
get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'
get  '/signup',  to: 'users#new'
post '/signup',  to: 'users#create'
get 'sessions/new'

resources :users
resources :events

end

Rails.application.routes.draw do
  get 'libraries/search'

  post '/search', to: 'books#search'
  get '/search', to: 'books#search'

  get '/library', to: 'libraries#search'
  post '/library', to: 'libraries#search'
  post '/select_library', to: 'libraries#select_library'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#index'
end

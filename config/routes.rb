Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    #scope ENV['MYAPP_RELATIVE_URL_ROOT'] || '/' do
      # Routes here
    namespace :api do
      namespace :v1 do
        get '/search', to: 'users#search'
        post '/login', to: 'auth#create'
        post '/users', to: 'users#create'
        resources :users do
          resources :photos,shallow: true
          get '/requests', to: 'friendships#get_requests'
          patch '/accept', to: 'friendships#accept'
          get '/following',to: 'users#following'
          get '/feed',to: 'users#feed'
          get '/profile_photos',to: 'users#profile_photos'

        end
        resources :friendships, only: [:create,:update,:delete]
        resources :comments, only:[:create,:update,:delete]
      end
    end
  #end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :photos,shallow: true
      end
      resources :comments, only:[:create,:update,:delete]
    end
  end
end

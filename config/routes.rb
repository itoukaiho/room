Rails.application.routes.draw do
  
  
  
  devise_for :users
  root to: "users#index"
  resources :users
  resources :profiles
  resources :rooms do
    collection do
      get 'search'
      get 'area'
    end
  end

resources :rooms do
   resource :reservation do
   collection do
  post 'confirm'
        end
      end   
    end

  
resources :reservations, only: [:index]
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

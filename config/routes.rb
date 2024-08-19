Rails.application.routes.draw do
  
  
  resources :reservations do
  collection do
    post 'confirm'
  end
end


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
  
    

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [ :index, :create, :update, :destroy ]
      resources :products, only: [ :index, :create, :update, :destroy ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

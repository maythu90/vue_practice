Rails.application.routes.draw do
  #get 'home/index'
  root to: 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #api routing
  namespace :api, {format: 'json'} do
    namespace :v1 do
    	resources :employees, only: [:index, :show, :create, :update, :destroy]
    end
  end
end

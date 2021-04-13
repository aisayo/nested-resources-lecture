Rails.application.routes.draw do

  root 'application#root'
  resources :donors

  # nested routes should go in one direction
  # parent to child

  # only nested routes we want index, new, create
  # resources :organizations do  # 7 restful routes
  #   resources :donations, only: [:index, :new, :create] #7 restful routes for nested resources
  # end 

  # resources :donations
  resources :donations, only: [:index, :new, :create] # anything non-nested

  # only nested routes we want index, new, create
  resources :organizations do  # 7 restful routes
    resources :donations, shallow: true #7 restful routes for nested resources
  end 


  






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :toll_locators
  post "findToll", to: "toll_locators#create"
  resources :tolls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

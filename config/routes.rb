Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root "foods#index"
  resources :publics
  resources :general_shopping_lists
  resources :foods
  
    resources :recipes do
      resources :recipe_foods
      member do
        patch :recipe_update
      end
  end


end

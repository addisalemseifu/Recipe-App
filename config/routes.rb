Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# put '/recipes/:id', to: 'recipes#recipe_update'
  # Defines the root path route ("/")
  # root "articles#index"

  root "foods#index"
  # resources :users
  # resources :foods
  # resources :recipes
  # resources :recipe_foods
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

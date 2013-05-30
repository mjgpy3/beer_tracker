BeerTracker::Application.routes.draw do
  devise_for :users

  resources :beers

  get "profile/index"

  root :to => "profile#index"
end

BeerTracker::Application.routes.draw do
  devise_for :users

  resources :beers

  get "profile/index"
  get "profile/add_tried_from_list"
  get "profile/add_tried_by_new"

  root :to => "profile#index"
end

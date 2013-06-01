BeerTracker::Application.routes.draw do
  devise_for :users

  resources :beers

  get "profile/index"
  get "profile/add_tried_from_list"
  get "profile/add_tried_by_new"
  post "profile/create_tried"
  post "profile/create_beer_and_tried"

  root :to => "profile#index"
end

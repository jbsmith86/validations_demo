ValidationsDemo::Application.routes.draw do
  get "dogs/index"
  get "dogs/show"
  get "dogs/edit"
  get "dogs/new"
  resources :cats
  resources :dogs
  resources :people
end

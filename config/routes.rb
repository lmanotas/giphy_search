Rails.application.routes.draw do
  devise_for :users

  get '/'  => 'home#index',   to: :root
  get '/search' => 'gifs#search',  as: :search_gifs
  
  resources :gifs, only: [:create, :index]

end

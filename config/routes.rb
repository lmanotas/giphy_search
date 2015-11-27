Rails.application.routes.draw do
  devise_for :users

  get '/'  => 'home#index',   to: :root
  post '/' => 'gifs#search',  as: :search_gifs
    
end

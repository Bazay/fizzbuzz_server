Rails.application.routes.draw do
  root to: 'home#index'
  root to: 'home#index', as: :home

  get '/about' => 'home#about', as: :about

  mount ApplicationAPI => '/api'
end

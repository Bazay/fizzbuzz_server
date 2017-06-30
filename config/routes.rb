Rails.application.routes.draw do
  root to: 'home#index'
  root to: 'home#index', as: :home

  mount ApplicationAPI => '/api'
end

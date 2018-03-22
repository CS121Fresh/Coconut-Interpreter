Rails.application.routes.draw do
  get 'demo/index'

  resources :posts

  root 'interface#index'
  get 'interface/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

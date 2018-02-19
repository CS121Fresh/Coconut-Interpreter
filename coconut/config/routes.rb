Rails.application.routes.draw do
  root 'interpreter#index'
  
  get 'interpreter/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

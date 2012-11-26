ArValidationTwo::Application.routes.draw do
 root :to => 'customers#index'
 resources :customers
 resources :orders
end

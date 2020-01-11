Rails.application.routes.draw do
  get 'site/index'
  get 'site/example1'
  get 'site/example2'
  get 'site/example3'
  get 'site/example4'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
end

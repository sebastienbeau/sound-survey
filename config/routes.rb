Rails.application.routes.draw do
  get 'answers/index'
  post 'answers/new'
  get 'site/index'
  get 'site/consigne'
  get 'site/example1'
  get 'site/example2'
  get 'site/example3'
  get 'site/check-sound'
  get 'site/logout'
  get 'site/finish'
  post 'site/update_user'
  get 'site/thanks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
end

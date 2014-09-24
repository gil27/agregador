Rails.application.routes.draw do
  get 'ideas/index'
  resources :ideas
  get 'sobre' => 'ideas#about'
  get 'execute' => 'ideas#execute'
  root 'ideas#index'

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as: 'signout'
end

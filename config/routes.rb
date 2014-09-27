Rails.application.routes.draw do
  get 'ideas/index'
  resources :ideas
  get 'sobre' => 'ideas#about'
  get 'execute' => 'ideas#execute'
  root 'ideas#index'

  get 'welcome' => 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as: 'signout'
end

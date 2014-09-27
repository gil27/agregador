Rails.application.routes.draw do
  get 'ideas/index'
  resources :ideas
  get 'sobre' => 'ideas#about'
  get 'execute' => 'ideas#execute'
  root 'ideas#index'

  get 'welcome' => 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/welcome')
end

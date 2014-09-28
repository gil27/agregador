Rails.application.routes.draw do
  get 'ideas/index'
  resources :ideas
  resources :users, only: :show
  get 'sobre' => 'ideas#about'
  get 'execute' => 'ideas#execute'
  root 'ideas#index'

  get 'minhas-ideias' => 'user#ideas', as: :user_ideas

  get 'welcome' => 'welcome#index'

  get 'vote' => 'votes#vote', as: :vote

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/failure', to: redirect('/welcome')
end

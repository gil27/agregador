Rails.application.routes.draw do
  get 'ideas/index'
  resources :ideas
  get 'sobre' => 'ideas#about'
  get 'execute' => 'ideas#execute'
  root 'ideas#index'
end

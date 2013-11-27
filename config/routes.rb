EffectiveContracts::Application.routes.draw do
  resources :permissions,   :except => [:update]
  resources :users,         :only   => [:index]
  root :to => 'application#index'
  get 'search' => 'search#index'
  resources :lecturers
  resources :values
end

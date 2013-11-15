EffectiveContracts::Application.routes.draw do
  resources :permissions,   :except => [:show, :update]
  resources :users,         :only   => [:index]
  root :to => 'application#index'
end

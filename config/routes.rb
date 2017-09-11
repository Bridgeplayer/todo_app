Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasklists#index'

  # resources :tasklists, only: [:index, :new, :create] 
  resources :tasklists, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  	resources :tasks, only: [:new, :create, :edit, :destroy, :update]
  end

end

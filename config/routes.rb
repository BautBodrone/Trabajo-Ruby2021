Rails.application.routes.draw do
  devise_scope :user do
    root to:'devise/sessions#new'
  end
  devise_for :users
  resources :appointments
  resources :users
  resources :professionals
  #get 'professionals/month/:id', to: 'professionals#month'
  resources :professionals do
    member do
      get 'month'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

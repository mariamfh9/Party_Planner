Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers =>{:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end 
  devise_scope :user do 
    get 'signup', to: 'devise/registrations#new'
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :categories, only: [:show]
  
  resources :parties, only: [:show, :new, :edit, :update] do
    resources :todos, only: [:show, :new, :edit]
  end

  resources :todos, only: [:create, :update, :destroy]
  resources :todos, only: [:create, :update, :destroy]

end

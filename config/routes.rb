ParadaDeOnibusWeb::Application.routes.draw do

  resources :empresas

  resources :linhas do
    resources :horarios
    resources :itinerarios
  end

  resources :enderecos

  resources :bairros

  resources :cidades

  resources :estados

  devise_for :users

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  root :to => "linhas#index"

end

Rails.application.routes.draw do
  resources :notifications
  resources :players
  resources :teams do
    collection do
      get 'list_players', to: 'teams#list_players', as: 'list_players'
    end
  end
  resources :matches do
    collection do
      get 'classification', to: 'matches#classification', as: 'classification'
      get 'export_report', to: 'matches#export_report', as: 'export_report'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "matches#index"
end

Rails.application.routes.draw do
  resources :sudos
  get 'configuration_detail_types/format_configure_type'
  get 'configuration_templates/versions'
  resources :configuration_detail_types
  resources :configuration_details
  resources :configuration_files
  resources :configuration_templates
  resources :catalog_items
  resources :object_types
  resources :blueprint_objects
  resources :blueprints
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'welcome/landing'
  get 'welcome/main'
  authenticated do
    root :to => 'welcome#main'
  end

  root 'welcome#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

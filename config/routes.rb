Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'welcome/landing'
  get 'welcome/main'
  authenticated do
    root :to => 'welcome#main'
  end

  root 'welcome#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
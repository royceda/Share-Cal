Rails.application.routes.draw do

  root 'pages#index'
  #get 'pages/index'

  resources :events

  #scheduler
  get 'pages/scheduler'

  #data
  match "data/events", :to => "events#data", :as => "data_path", :via => "get"
  #match "data/db_action", :to => "events#db_action", :as => "db_action", :via => "post"

  match "data/db_action", :to => "events#db_action", :as => "db_action", :via => "get"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

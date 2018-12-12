Rails.application.routes.draw do
  resources :skills
  resources :teams
  resources :employees
  get '/skills/new' => 'skills#new' , as: 'newskill'
  post '/skills/new' => 'skills#create'
  get '/teams/new' => 'teams#new' , as: 'newteam'
  post '/teams/new' => 'teams#create'
  get '/employees/new' => 'employees#new' , as: 'newemployee'
  post '/employees/new' => 'employees#create'
  get 'welcome/index'
  
  root 'welcome#index'
end
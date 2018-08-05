Rails.application.routes.draw do
  resources :enrolments
  resources :students
  resources :teachers
  resources :lessons
  resources :progresses


  root 'enrolments#index'

  #get '/event_details', to: 'menus#event_details'


  get '/show_enrolment', to: 'enrolments#show_enrolments'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

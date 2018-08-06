Rails.application.routes.draw do
  resources :enrolments
  resources :students
  resources :teachers
  resources :lessons
  resources :progresses

  root 'teachers#index'

  get '/show_enrolment', to: 'enrolments#show_enrolments'
  get '/students_class/:id', to: 'students#students_class'
  get '/update_student_progress/:id', to: 'progresses#update_student_progress'
  get '/new_progress/:id', to: 'progresses#new_progress'
end

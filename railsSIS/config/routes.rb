Rails.application.routes.draw do
  get 'homepage/index' , as: 'homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :courses
  resources :teacher
  resources :aattendance
  resources :sstudents

  get 'coursesEditAttendance', to: 'courses#editAttendance'
  get '/courses/:id/editAttendance(.:format)', to: 'courses#editAttendance', as: 'courses_editAttendance'
  root 'homepage#index'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :courses
  resources :teacher
  resources :aattendance

  get 'coursesEditAttendance', to: 'courses#editAttendance'
  get '/courses/:id/editAttendance(.:format)', to: 'courses#editAttendance', as: 'courses_editAttendance'
end

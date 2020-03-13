Rails.application.routes.draw do
  get 'homepage/index' , as: 'homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :courses
  resources :teacher
  resources :attendance
  resources :sstudents

  get '/courses/:id/editAttendance(.:format)', to: 'courses#editAttendance', as: 'courses_editAttendance'
  get '/courses/:id/showAttendance(.:format)', to: 'courses#showAttendance', as: 'courses_showAttendance'
  post '/courses/:id/editAttendance(.:format)', to: 'courses#saveAttendance'
  get '/sstudents/:id/courses(.:format)', to: 'sstudents#courses', as: 'sstudents_courses'
  root 'homepage#index'
end

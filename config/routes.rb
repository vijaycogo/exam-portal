Rails.application.routes.draw do
  post '/enroll_user', to: 'enroll_user#enroll_user'
end

Rails.application.routes.draw do
  post 'enroll_user', to: 'enroll_user#enroll_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

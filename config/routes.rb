Rails.application.routes.draw do
  root "boards#index"
  resources :boards

  get "/users/sign_up", to: "registrations#new" ,as: "sign_up"
  post "/users/register", to: "registrations#create", as: "register"

  get "/users/sign_in", to: "sessions#new", as: "sign_in"
  post "/users/login", to: "sessions#create", as: "login"
  delete "/users/sign_out", to: "sessions#destroy", as: "sign_out"
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" } 
  root "logs#unresolved"
  resources :logs
  get "/unresolved", to: "logs#unresolved"
  get "/resolved", to: "logs#resolved"
  patch "/logs/:id/resolve_log", to: "logs#resolve_log", as: "resolve_log"
end

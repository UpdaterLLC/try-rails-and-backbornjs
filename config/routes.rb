Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'todos#index'
  resources :todos, only: [:index, :show, :update, :destroy]
end

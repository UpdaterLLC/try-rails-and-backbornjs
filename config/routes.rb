Rails.application.routes.draw do
  resources :todos, only: [:index, :show, :update, :destroy]
end

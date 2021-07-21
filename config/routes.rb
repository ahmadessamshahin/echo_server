Rails.application.routes.draw do
  resources :endpoints
  match '*path' => 'echo#handler', via: :all

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

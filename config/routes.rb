Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create edit]
  resources :users do
    put 'edit', action: :edit
  end
end

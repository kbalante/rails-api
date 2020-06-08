Rails.application.routes.draw do
  resources :users do
    collection do
      post 'login'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

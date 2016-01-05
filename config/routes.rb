Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
        get 'merchants/find', to: 'merchants#find'
    end
  end
end

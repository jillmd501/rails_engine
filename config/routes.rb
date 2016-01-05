Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
        get 'merchants/find', to: 'merchants#find'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show]
        get 'customers/find', to: 'customers#find'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :invoice_items, only: [:index, :show]
        get 'invoice_items/find', to: 'invoice_items#find'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show]
        get 'invoices/find', to: 'invoices#find'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
        get 'items/find', to: 'items#find'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :show]
        get 'transactions/find', to: 'transactions#find'
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
        get 'merchants/find', to: 'merchants#find'
        get 'merchants/find_all', to: 'merchants#find_all'
        get 'merchants/items', to: 'merchants#items'
        get 'merchants/invoices', to: 'merchants#invoices'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show]
        get 'customers/find', to: 'customers#find'
        get 'customers/find_all', to: 'customers#find_all'
        get 'customers/items', to: 'customers#items'
        get 'customers/invoices', to: 'customers#invoices'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :invoice_items, only: [:index, :show]
        get 'invoice_items/find', to: 'invoice_items#find'
        get 'invoice_items/find_all', to: 'invoice_items#find_all'
        get 'invoice_items/items', to: 'invoice_items#items'
        get 'invoice_items/invoices', to: 'invoice_items#invoices'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show]
        get 'invoices/find', to: 'invoices#find'
        get 'invoices/find_all', to: 'invoices#find_all'
        get 'invoices/items', to: 'invoices#items'
        get 'invoices/invoices', to: 'invoices#invoices'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
        get 'items/find', to: 'items#find'
        get 'items/find_all', to: 'items#find_all'
        get 'items/items', to: 'items#items'
        get 'items/invoices', to: 'items#invoices'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :show]
        get 'transactions/find', to: 'transactions#find'
        get 'transactions/find_all', to: 'transactions#find_all'
        get 'transactions/items', to: 'transactions#items'
        get 'transactions/invoices', to: 'transactions#invoices'
    end
  end
end

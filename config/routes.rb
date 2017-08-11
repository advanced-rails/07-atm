Rails.application.routes.draw do
    root to: 'accounts#index'
    resources :accounts, only: [:index, :new, :create, :destroy] do
        member do
            get '/deposits', to: 'accounts#transactions'
            get '/withdraws', to: 'accounts#transactions'
            get '/overdrafts', to: 'accounts#transactions'
            get '/unfreezes', to: 'accounts#transactions'
            get '/atm', to: 'accounts#atm'
            post '/deposit', to: 'accounts#deposit'
            post '/withdraw', to: 'accounts#withdraw'
            post '/unfreeze', to: 'accounts#unfreeze'
        end
    end
end

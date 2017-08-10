Rails.application.routes.draw do
    root to: 'accounts#index'
    resources :accounts, only: [:index] do
        member do
            get '/atm', to: 'accounts#atm'
            post '/deposit', to: 'accounts#deposit'
            post '/withdraw', to: 'accounts#withdraw'
            post '/unfreeze', to: 'accounts#unfreeze'
        end
    end
end

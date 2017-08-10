Rails.application.routes.draw do
    root to: 'accounts#index'
    resources :accounts, only: [:index] do
        member do
            get '/atm', to: 'accounts#atm'
            post '/deposit', to: 'accounts#deposit'
        end
    end
end

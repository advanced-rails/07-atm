class AccountsController < ApplicationController
    def index
        @accounts = Account.order(id: :desc)
    end

    def atm
        @account = Account.find(params[:id])
    end

    def deposit
        @account = Account.find(params[:id])
        @account.deposit(params[:amount].to_f)

        if @account.errors.any?
            render 'atm'
        else
            redirect_to root_url
        end
    end
end

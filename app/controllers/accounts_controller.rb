class AccountsController < ApplicationController
    def index
        @accounts = Account.order(id: :desc)
    end

    def atm
        @account = Account.find(params[:id])
    end

    def new
        @account = Account.new
    end

    def create
        @account = Account.new(params[:account].permit(:name, :category))
        if @account.save
            redirect_to root_url
        else
            render 'new'
        end
    end

    def destroy
        account = Account.find(params[:id])
        account.destroy
        redirect_to root_url
    end

    def transactions
        account = Account.find(params[:id])
        @category = request.path.split('/').last.capitalize[0..-2]
        @transactions = account.filter_transactions(@category)
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

    def withdraw
        @account = Account.find(params[:id])
        @account.withdraw(params[:amount].to_f)

        if @account.errors.any?
            render 'atm'
        else
            redirect_to root_url
        end
    end

    def unfreeze
        @account = Account.find(params[:id])
        @account.unfreeze

        if @account.errors.any?
            render 'atm'
        else
            redirect_to root_url
        end
    end
end

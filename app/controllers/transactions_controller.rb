class TransactionsController < ApplicationController
  def index
    @account = Account.find(params[:account_id])
  end

  def new
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.new
  end

  def create
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.new(transaction_params)
    if @transaction.save
      redirect_to account_transactions_path(@account)
    else
      render :action => 'new'
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to account_transactions_path(@transaction.account)
    else
      render :action => :edit
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @account = @transaction.account
    @transaction.destroy
    redirect_to account_transactions_path(@account)
  end

  private
    def transaction_params
      params.require(:transaction).permit(:description, :import, :category_id)
    end
end
class AccountsController < ApplicationController

  def new
    
  end

  def show
    @account = Account.find params[:id]
    render layout: nil
  end

end

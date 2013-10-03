class CustomersController < ApplicationController
  def customer_present
    @search = Customer.where({ :mobile_number => params[:id] })

    if @search.count > 0
      session[:mobile_number] = params[:id]
      render :json => { present: true, id: @search.first.id }
    else
      render :json => { present: false }
    end
  end

  def show
    @customer = Customer.find params[:id]
    render layout: nil
  end

  def new
    @customer = Customer.new({ mobile_number: params[:id] })
    @account = @customer.accounts.build
  end

  def create
    @customer = Customer.new customer_params
    if @customer.save
      session[:mobile_number] = @customer.mobile_number
      redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit!
  end

end

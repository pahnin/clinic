class CheckinsController < ApplicationController
  before_filter :authenticate , only:  [:destroy]

  def index
    @checkin = Checkin.new
  end

  def mobile_numbers_autocomplete
    search = Customer.search( mobile_number_eq: params[:q].to_i )
    @mobile_numbers = search.result.page(params[:page])    
  end

  def create
    @checkin = Checkin.new checkin_params
    if @checkin.save
      redirect_to root_path
    else
      render :index
    end
  end

  def history
    @history = Checkin.search( account_id_eq: params[:id] ).result
    render layout: nil
  end

  def destroy
    @checkin = Checkin.find params[:id]
    if @checkin.destroy!
      redirect_to root_path
    end
  end

  private


  def checkin_params
    params.require(:checkin).permit!
  end

end

class ReportsController < ApplicationController

  before_filter :authenticate

  def index
    @reports = Checkin.where({created_at: Date.today}).paginate(:page => params[:page])
  end

  def this_week
    @reports = Checkin.where({created_at: (Date.today-7)..Date.today}).paginate(:page => params[:page])
    render 'index'
  end

  def this_month
    @reports = Checkin.where({created_at: (Date.today-30)..Date.today}).paginate(:page => params[:page])
    render 'index'
  end

  def this_year
    @reports = Checkin.where({created_at: (Date.today-365)..Date.today}).paginate(:page => params[:page])
    render 'index'
  end

end 

require 'date'

class DaysSinceController  < ApplicationController
  def show
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    time = DateTime.new(year, month, day)

    @result = (DateTime.now-time).to_i

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml =>  @result }
      format.json { render :json => @result }
    end
  end
end
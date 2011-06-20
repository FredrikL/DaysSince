require 'date'

class DaysSinceController  < ApplicationController
  def show
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    time = DateTime.new(year, month, day)

    @result = DaysSince.new((DateTime.now-time).to_i)

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml =>  @result.to_xml }
      format.json { render :json => @result }
    end
  end

  class DaysSince
    attr_accessor :days

    def initialize(days)
      self.days = days
    end
  end
end
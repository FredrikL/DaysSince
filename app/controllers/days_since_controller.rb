require 'date'

class DaysSinceController  < ApplicationController
  class DaysSinceResult # should live in models..
    attr_accessor :days

    def initialize(days)
      self.days = days
    end
  end

  def show
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    time = DateTime.new(year, month, day)

    @result = DaysSinceResult.new((DateTime.now-time).to_i)

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml =>  @result.to_xml }
      format.json { render :json => @result }
    end
  end
end
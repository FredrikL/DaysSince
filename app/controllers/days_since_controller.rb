require 'date'

class DaysSinceController  < ApplicationController
  class DaysSinceResult # should live in models..
    attr_accessor :days

    def initialize(days)
      self.days = days
    end
  end

  def show
    time = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i).utc

    @result = DaysSinceResult.new((DateTime.now.utc-time).to_i)

    respond_to do |format|
      format.html # show.html.erb
      #format.xml  { render :xml =>  @result.to_xml }
      format.json { render :json => @result }
    end
  end
end
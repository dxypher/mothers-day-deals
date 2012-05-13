require 'open-uri'
require 'json'

class DealsController < ApplicationController
 
  def index
    @choices = Choice.all
    @location = Location.last
    @deals = JSON.parse(open("http://api.groupon.com/v2/deals/?client_id=0c28cc83918dfc63dcf8d6a798613b6fbb6c6c3e&lat=#{@location["lat"]}&lng=#{@location["lng"]}").read)
    
    @type = ["Nester", "Kitchen Couture", "Healthy Living", "Fountain of Youth", "Gadget + Gear",
                "Home Improvement", "Audiophile", "Threads", "Cultural Pursuits", "Pampered", 
                "Sporting Life", "Well-Groomed", "The Finer Things", "Photographic", "Just Dance",
                "Girls Night Out"]
    
  end

  def new
    	@location = Location.new
    end
    def create
    	@location = Location.new(params[:location])
    	@location.save
    	redirect_to '/'
    end

    def show
      @choice = Choice.find_by_id(params[:id])
    end

  end

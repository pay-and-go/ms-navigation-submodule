require 'json'
class TollLocatorsController < ApplicationController
  before_action :set_toll_locator, only: [:show, :update, :destroy]

  # GET /toll_locators
  def index
    @tolls = Toll.all
    @toll_locator = TollLocator.all
    
    render json: @tolls.to_json(only: [:coor_lat, :coor_lng, :name, :tollId])
  end

  # GET /toll_locators/1
  def show
    render json: @toll_locator
  end

  def distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm         = 6371          # Earth radius in kilometers
    rm          = rkm * 1000    # Radius in meters
  
    dlat_rad    = (loc2[0]-loc1[0]) * rad_per_deg # Delta, converted to rad
    dlon_rad    = (loc2[1]-loc1[1]) * rad_per_deg
  
    lat1_rad    = loc1.map {|i| i * rad_per_deg }.first
    lat2_rad    = loc2.map {|i| i * rad_per_deg }.first
  
    a           = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c           = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
  
    rm * c # Delta in meters
  end
  # POST /toll_locators
  def create
    @tolls = Toll.all
    @toll_locator = TollLocator.new(toll_locator_params)
    @tollsJson = JSON.parse(@tolls.to_json(only: [:coor_lat, :coor_lng, :name, :tollId]))
    @lat = @toll_locator.coor_lat
    @lng = @toll_locator.coor_lng
    hash = {}
    @tollsJson.each_with_index {|val, index| 
      d = distance([val["coor_lat"], val["coor_lng"]],[@lat, @lng])
      hash[index] = d
    }
    h = hash.sort {|(k1, v1), (k2, v2)| v1 == v2 ? k1 <=> k2 : v1 <=> v2 }
    # puts "#{h[0][0]}" 
    # puts "Test #{@tollsJson[0]["coor_lat"]}"
    # puts "Lat #@lat"
    # puts "Lng #@lng"
    
    render json: @tollsJson[h[0][0]]

    # if @toll_locator.save
    #   render json: @toll_locator, status: :created, location: @toll_locator
    # else
    #   render json: @toll_locator.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /toll_locators/1
  # def update
  #   if @toll_locator.update(toll_locator_params)
  #     render json: @toll_locator
  #   else
  #     render json: @toll_locator.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /toll_locators/1
  # def destroy
  #   @toll_locator.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_toll_locator
      @toll_locator = TollLocator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def toll_locator_params
      params.require(:toll_locator).permit(:coor_lat, :coor_lng)
    end
end

class TollLocator
  include Mongoid::Document
  field :coor_lat, type: Float
  field :coor_lng, type: Float
end

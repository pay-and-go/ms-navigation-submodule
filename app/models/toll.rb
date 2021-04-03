class Toll
  include Mongoid::Document
  store_in collection: "Tolls"
  field :administrator, type: String
  field :coor_lat, type: Float
  field :coor_lng, type: Float
  field :crane_phone_number, type: String
  field :name, type: String
  field :price, type: Integer
  field :sector, type: String
  field :territory, type: String
  field :tollId, type: Integer
  field :toll_phone_number, type: String
end

require "test_helper"

class TollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toll = tolls(:one)
  end

  test "should get index" do
    get tolls_url, as: :json
    assert_response :success
  end

  test "should create toll" do
    assert_difference('Toll.count') do
      post tolls_url, params: { toll: { administrator: @toll.administrator, coor_lat: @toll.coor_lat, coor_lng: @toll.coor_lng, crane_phone_number: @toll.crane_phone_number, name: @toll.name, price: @toll.price, sector: @toll.sector, territory: @toll.territory, tollId: @toll.tollId, toll_phone_number: @toll.toll_phone_number } }, as: :json
    end

    assert_response 201
  end

  test "should show toll" do
    get toll_url(@toll), as: :json
    assert_response :success
  end

  test "should update toll" do
    patch toll_url(@toll), params: { toll: { administrator: @toll.administrator, coor_lat: @toll.coor_lat, coor_lng: @toll.coor_lng, crane_phone_number: @toll.crane_phone_number, name: @toll.name, price: @toll.price, sector: @toll.sector, territory: @toll.territory, tollId: @toll.tollId, toll_phone_number: @toll.toll_phone_number } }, as: :json
    assert_response 200
  end

  test "should destroy toll" do
    assert_difference('Toll.count', -1) do
      delete toll_url(@toll), as: :json
    end

    assert_response 204
  end
end

require "test_helper"

class TollLocatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toll_locator = toll_locators(:one)
  end

  test "should get index" do
    get toll_locators_url, as: :json
    assert_response :success
  end

  test "should create toll_locator" do
    assert_difference('TollLocator.count') do
      post toll_locators_url, params: { toll_locator: { coor_lat: @toll_locator.coor_lat, coor_lng: @toll_locator.coor_lng } }, as: :json
    end

    assert_response 201
  end

  test "should show toll_locator" do
    get toll_locator_url(@toll_locator), as: :json
    assert_response :success
  end

  test "should update toll_locator" do
    patch toll_locator_url(@toll_locator), params: { toll_locator: { coor_lat: @toll_locator.coor_lat, coor_lng: @toll_locator.coor_lng } }, as: :json
    assert_response 200
  end

  test "should destroy toll_locator" do
    assert_difference('TollLocator.count', -1) do
      delete toll_locator_url(@toll_locator), as: :json
    end

    assert_response 204
  end
end

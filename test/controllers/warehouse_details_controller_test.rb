require "test_helper"

class WarehouseDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse_detail = warehouse_details(:one)
  end

  test "should get index" do
    get warehouse_details_url
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_detail_url
    assert_response :success
  end

  test "should create warehouse_detail" do
    assert_difference("WarehouseDetail.count") do
      post warehouse_details_url, params: { warehouse_detail: { product_id: @warehouse_detail.product_id, quantity: @warehouse_detail.quantity, warehouse_record_id: @warehouse_detail.warehouse_record_id } }
    end

    assert_redirected_to warehouse_detail_url(WarehouseDetail.last)
  end

  test "should show warehouse_detail" do
    get warehouse_detail_url(@warehouse_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_detail_url(@warehouse_detail)
    assert_response :success
  end

  test "should update warehouse_detail" do
    patch warehouse_detail_url(@warehouse_detail), params: { warehouse_detail: { product_id: @warehouse_detail.product_id, quantity: @warehouse_detail.quantity, warehouse_record_id: @warehouse_detail.warehouse_record_id } }
    assert_redirected_to warehouse_detail_url(@warehouse_detail)
  end

  test "should destroy warehouse_detail" do
    assert_difference("WarehouseDetail.count", -1) do
      delete warehouse_detail_url(@warehouse_detail)
    end

    assert_redirected_to warehouse_details_url
  end
end

require "test_helper"

class WarehouseRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse_record = warehouse_records(:one)
  end

  test "should get index" do
    get warehouse_records_url
    assert_response :success
  end

  test "should get new" do
    get new_warehouse_record_url
    assert_response :success
  end

  test "should create warehouse_record" do
    assert_difference("WarehouseRecord.count") do
      post warehouse_records_url, params: { warehouse_record: { quantity: @warehouse_record.quantity } }
    end

    assert_redirected_to warehouse_record_url(WarehouseRecord.last)
  end

  test "should show warehouse_record" do
    get warehouse_record_url(@warehouse_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_warehouse_record_url(@warehouse_record)
    assert_response :success
  end

  test "should update warehouse_record" do
    patch warehouse_record_url(@warehouse_record), params: { warehouse_record: { quantity: @warehouse_record.quantity } }
    assert_redirected_to warehouse_record_url(@warehouse_record)
  end

  test "should destroy warehouse_record" do
    assert_difference("WarehouseRecord.count", -1) do
      delete warehouse_record_url(@warehouse_record)
    end

    assert_redirected_to warehouse_records_url
  end
end

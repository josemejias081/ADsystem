require "application_system_test_case"

class WarehouseDetailsTest < ApplicationSystemTestCase
  setup do
    @warehouse_detail = warehouse_details(:one)
  end

  test "visiting the index" do
    visit warehouse_details_url
    assert_selector "h1", text: "Warehouse details"
  end

  test "should create warehouse detail" do
    visit warehouse_details_url
    click_on "New warehouse detail"

    fill_in "Product", with: @warehouse_detail.product_id
    fill_in "Quantity", with: @warehouse_detail.quantity
    fill_in "Warehouse record", with: @warehouse_detail.warehouse_record_id
    click_on "Create Warehouse detail"

    assert_text "Warehouse detail was successfully created"
    click_on "Back"
  end

  test "should update Warehouse detail" do
    visit warehouse_detail_url(@warehouse_detail)
    click_on "Edit this warehouse detail", match: :first

    fill_in "Product", with: @warehouse_detail.product_id
    fill_in "Quantity", with: @warehouse_detail.quantity
    fill_in "Warehouse record", with: @warehouse_detail.warehouse_record_id
    click_on "Update Warehouse detail"

    assert_text "Warehouse detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Warehouse detail" do
    visit warehouse_detail_url(@warehouse_detail)
    click_on "Destroy this warehouse detail", match: :first

    assert_text "Warehouse detail was successfully destroyed"
  end
end

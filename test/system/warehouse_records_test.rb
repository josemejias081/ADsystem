require "application_system_test_case"

class WarehouseRecordsTest < ApplicationSystemTestCase
  setup do
    @warehouse_record = warehouse_records(:one)
  end

  test "visiting the index" do
    visit warehouse_records_url
    assert_selector "h1", text: "Warehouse records"
  end

  test "should create warehouse record" do
    visit warehouse_records_url
    click_on "New warehouse record"

    fill_in "Quantity", with: @warehouse_record.quantity
    click_on "Create Warehouse record"

    assert_text "Warehouse record was successfully created"
    click_on "Back"
  end

  test "should update Warehouse record" do
    visit warehouse_record_url(@warehouse_record)
    click_on "Edit this warehouse record", match: :first

    fill_in "Quantity", with: @warehouse_record.quantity
    click_on "Update Warehouse record"

    assert_text "Warehouse record was successfully updated"
    click_on "Back"
  end

  test "should destroy Warehouse record" do
    visit warehouse_record_url(@warehouse_record)
    click_on "Destroy this warehouse record", match: :first

    assert_text "Warehouse record was successfully destroyed"
  end
end

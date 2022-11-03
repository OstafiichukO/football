require "application_system_test_case"

class PoolsTest < ApplicationSystemTestCase
  setup do
    @pool = pools(:one)
  end

  test "visiting the index" do
    visit pools_url
    assert_selector "h1", text: "Pools"
  end

  test "should create pool" do
    visit pools_url
    click_on "New pool"

    click_on "Create Pool"

    assert_text "Pool was successfully created"
    click_on "Back"
  end

  test "should update Pool" do
    visit pool_url(@pool)
    click_on "Edit this pool", match: :first

    click_on "Update Pool"

    assert_text "Pool was successfully updated"
    click_on "Back"
  end

  test "should destroy Pool" do
    visit pool_url(@pool)
    click_on "Destroy this pool", match: :first

    assert_text "Pool was successfully destroyed"
  end
end

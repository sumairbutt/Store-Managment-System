require "application_system_test_case"

class OrderHistoriesTest < ApplicationSystemTestCase
  setup do
    @order_history = order_histories(:one)
  end

  test "visiting the index" do
    visit order_histories_url
    assert_selector "h1", text: "Order histories"
  end

  test "should create order history" do
    visit order_histories_url
    click_on "New order history"

    click_on "Create Order history"

    assert_text "Order history was successfully created"
    click_on "Back"
  end

  test "should update Order history" do
    visit order_history_url(@order_history)
    click_on "Edit this order history", match: :first

    click_on "Update Order history"

    assert_text "Order history was successfully updated"
    click_on "Back"
  end

  test "should destroy Order history" do
    visit order_history_url(@order_history)
    click_on "Destroy this order history", match: :first

    assert_text "Order history was successfully destroyed"
  end
end

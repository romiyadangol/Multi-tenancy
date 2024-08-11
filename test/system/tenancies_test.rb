require "application_system_test_case"

class TenanciesTest < ApplicationSystemTestCase
  setup do
    @tenancy = tenancies(:one)
  end

  test "visiting the index" do
    visit tenancies_url
    assert_selector "h1", text: "Tenancies"
  end

  test "should create tenancy" do
    visit tenancies_url
    click_on "New tenancy"

    fill_in "Name", with: @tenancy.name
    click_on "Create Tenancy"

    assert_text "Tenancy was successfully created"
    click_on "Back"
  end

  test "should update Tenancy" do
    visit tenancy_url(@tenancy)
    click_on "Edit this tenancy", match: :first

    fill_in "Name", with: @tenancy.name
    click_on "Update Tenancy"

    assert_text "Tenancy was successfully updated"
    click_on "Back"
  end

  test "should destroy Tenancy" do
    visit tenancy_url(@tenancy)
    click_on "Destroy this tenancy", match: :first

    assert_text "Tenancy was successfully destroyed"
  end
end

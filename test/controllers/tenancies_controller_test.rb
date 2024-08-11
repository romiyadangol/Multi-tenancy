require "test_helper"

class TenanciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenancy = tenancies(:one)
  end

  test "should get index" do
    get tenancies_url
    assert_response :success
  end

  test "should get new" do
    get new_tenancy_url
    assert_response :success
  end

  test "should create tenancy" do
    assert_difference("Tenancy.count") do
      post tenancies_url, params: { tenancy: { name: @tenancy.name } }
    end

    assert_redirected_to tenancy_url(Tenancy.last)
  end

  test "should show tenancy" do
    get tenancy_url(@tenancy)
    assert_response :success
  end

  test "should get edit" do
    get edit_tenancy_url(@tenancy)
    assert_response :success
  end

  test "should update tenancy" do
    patch tenancy_url(@tenancy), params: { tenancy: { name: @tenancy.name } }
    assert_redirected_to tenancy_url(@tenancy)
  end

  test "should destroy tenancy" do
    assert_difference("Tenancy.count", -1) do
      delete tenancy_url(@tenancy)
    end

    assert_redirected_to tenancies_url
  end
end

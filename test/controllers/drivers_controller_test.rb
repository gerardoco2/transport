require 'test_helper'

class DriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get drivers_url
    assert_response :success
  end

  test "should get new" do
    get new_driver_url
    assert_response :success
  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post drivers_url, params: { driver: { address: @driver.address, cell_phone: @driver.cell_phone, company_name: @driver.company_name, name: @driver.name, non_runners: @driver.non_runners, number_of_trucks: @driver.number_of_trucks, phone: @driver.phone, website: @driver.website } }
    end

    assert_redirected_to driver_url(Driver.last)
  end

  test "should show driver" do
    get driver_url(@driver)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver_url(@driver)
    assert_response :success
  end

  test "should update driver" do
    patch driver_url(@driver), params: { driver: { address: @driver.address, cell_phone: @driver.cell_phone, company_name: @driver.company_name, name: @driver.name, non_runners: @driver.non_runners, number_of_trucks: @driver.number_of_trucks, phone: @driver.phone, website: @driver.website } }
    assert_redirected_to driver_url(@driver)
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete driver_url(@driver)
    end

    assert_redirected_to drivers_url
  end
end

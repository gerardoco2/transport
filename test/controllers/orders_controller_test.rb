require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { balance_on_delivery: @order.balance_on_delivery, booking_deposit: @order.booking_deposit, color: @order.color, condition: @order.condition, customer_id: @order.customer_id, delivery_address: @order.delivery_address, delivery_contact: @order.delivery_contact, direction: @order.direction, driver_id: @order.driver_id, driver_pay: @order.driver_pay, estimated_pickup_date: @order.estimated_pickup_date, grand_total: @order.grand_total, no_runner: @order.no_runner, notes: @order.notes, pickup_address: @order.pickup_address, pickup_contact: @order.pickup_contact, plate: @order.plate, reservation: @order.reservation, security_password: @order.security_password, security_question: @order.security_question, service_type_id: @order.service_type_id, shipping_from_city: @order.shipping_from_city, shipping_from_province: @order.shipping_from_province, shipping_to_city: @order.shipping_to_city, shipping_to_province: @order.shipping_to_province, tax: @order.tax, transit_time: @order.transit_time, transport_type_id: @order.transport_type_id, vin: @order.vin, year_make_model: @order.year_make_model } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { balance_on_delivery: @order.balance_on_delivery, booking_deposit: @order.booking_deposit, color: @order.color, condition: @order.condition, customer_id: @order.customer_id, delivery_address: @order.delivery_address, delivery_contact: @order.delivery_contact, direction: @order.direction, driver_id: @order.driver_id, driver_pay: @order.driver_pay, estimated_pickup_date: @order.estimated_pickup_date, grand_total: @order.grand_total, no_runner: @order.no_runner, notes: @order.notes, pickup_address: @order.pickup_address, pickup_contact: @order.pickup_contact, plate: @order.plate, reservation: @order.reservation, security_password: @order.security_password, security_question: @order.security_question, service_type_id: @order.service_type_id, shipping_from_city: @order.shipping_from_city, shipping_from_province: @order.shipping_from_province, shipping_to_city: @order.shipping_to_city, shipping_to_province: @order.shipping_to_province, tax: @order.tax, transit_time: @order.transit_time, transport_type_id: @order.transport_type_id, vin: @order.vin, year_make_model: @order.year_make_model } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end

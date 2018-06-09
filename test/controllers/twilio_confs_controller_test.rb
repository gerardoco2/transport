require 'test_helper'

class TwilioConfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twilio_conf = twilio_confs(:one)
  end

  test "should get index" do
    get twilio_confs_url
    assert_response :success
  end

  test "should get new" do
    get new_twilio_conf_url
    assert_response :success
  end

  test "should create twilio_conf" do
    assert_difference('TwilioConf.count') do
      post twilio_confs_url, params: { twilio_conf: { acct_id: @twilio_conf.acct_id, auth_token: @twilio_conf.auth_token, phone_number: @twilio_conf.phone_number, status: @twilio_conf.status } }
    end

    assert_redirected_to twilio_conf_url(TwilioConf.last)
  end

  test "should show twilio_conf" do
    get twilio_conf_url(@twilio_conf)
    assert_response :success
  end

  test "should get edit" do
    get edit_twilio_conf_url(@twilio_conf)
    assert_response :success
  end

  test "should update twilio_conf" do
    patch twilio_conf_url(@twilio_conf), params: { twilio_conf: { acct_id: @twilio_conf.acct_id, auth_token: @twilio_conf.auth_token, phone_number: @twilio_conf.phone_number, status: @twilio_conf.status } }
    assert_redirected_to twilio_conf_url(@twilio_conf)
  end

  test "should destroy twilio_conf" do
    assert_difference('TwilioConf.count', -1) do
      delete twilio_conf_url(@twilio_conf)
    end

    assert_redirected_to twilio_confs_url
  end
end

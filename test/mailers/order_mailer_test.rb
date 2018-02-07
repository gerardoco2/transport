require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "new_contract" do
    mail = OrderMailer.new_contract
    assert_equal "New contract", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

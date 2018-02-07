# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/new_contract
  def new_contract
  	order = Order.last
    OrderMailer.new_contract(order)
  end

end

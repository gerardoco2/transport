class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_contract.subject
  #
  def new_contract(order)
    
    @order = order

    mail( to: @order.customer.email, subject: "CONTRACT FOR YOUR AUTO TRANSPORT SERVICE", cc: "gerardocolina_20@hotmail.com" )
  end
end

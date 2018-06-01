class DriverMailer < ApplicationMailer

	def update_orders_mailer(driver)
		@driver = driver
		@orders = @driver.orders 
		mail(to: @driver.email, subject: "Orders Update Request")
	end
end

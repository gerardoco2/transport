class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  protected

  	def send_sms(number, message)
		acct_sid = 'AC04e121d94419a5bbcbacdde28217792e'
		auth_token = 'a8294b5626fe90c374d9e579194da313'
		desde = '+17815247182'

		@client = Twilio::REST::Client.new acct_sid, auth_token

		@client.api.account.messages.create(
		  from: desde,
		  to: number,
		  body: message
		)
	end

end

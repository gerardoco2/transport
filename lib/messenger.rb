module Messenger

	def send_sms(number, message)
		acct_sid = ''
		auth_token = ''
		from = 

		@client = Twilio::REST::Client.new acct_sid, auth_token

		@client.api.account.messages.create(
		  from: '+14159341234',
		  to: number,
		  body: 'Hey there!'
		)
	end

end
json.extract! twilio_conf, :id, :acct_id, :auth_token, :phone_number, :status, :created_at, :updated_at
json.url twilio_conf_url(twilio_conf, format: :json)

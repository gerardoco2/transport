json.extract! customer, :id, :name, :lastname, :email, :cell_phone, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)

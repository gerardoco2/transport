json.extract! route, :id, :driver_id, :province_from, :city_from, :province_to, :city_to, :created_at, :updated_at
json.url route_url(route, format: :json)

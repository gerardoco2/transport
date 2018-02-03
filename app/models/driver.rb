class Driver < ApplicationRecord
	has_many :routes, dependent: :destroy
	has_many :orders
end

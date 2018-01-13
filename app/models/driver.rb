class Driver < ApplicationRecord
	has_many :routes, dependent: :destroy
end

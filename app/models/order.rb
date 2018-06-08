class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :driver, optional: true
  belongs_to :service_type
  belongs_to :transport_type



end

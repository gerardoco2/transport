class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :driver, optional: true
  belongs_to :service_type
  belongs_to :transport_type


	#used to calculate the percentage od the progress bar in the orders
  def advance(pick_up, transit_time )
  	if pick_up != nil
  		res =   Date.today - pick_up
		percent = (res * 100 ) / transit_time
		if percent > 100
			100
		elsif status == "Delivered"
			100
		else
			percent.to_i	
		end
		
  	else
  		0
  	end


  end


end

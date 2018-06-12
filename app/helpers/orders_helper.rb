module OrdersHelper

  def generateButton( order, status) 
  	if status == "Assigned"
  		link_to 'Pick Up', pickup_path(order),  :class=>'pick btn btn-block btn-primary', remote: true 
  	elsif status == "In Transit"
  		link_to 'Deliver', deliver_path(order),  :class=>'deliver btn btn-block btn-danger', remote: true 
  	end
  end
end

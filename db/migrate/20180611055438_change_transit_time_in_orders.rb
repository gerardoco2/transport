class ChangeTransitTimeInOrders < ActiveRecord::Migration[5.1]
  def up
  	change_column :orders, :transit_time, :integer
  end

  def down
  	change_column :orders, :transit_time, :string
  end
end

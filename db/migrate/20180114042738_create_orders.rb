class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.references :driver, foreign_key: true
      t.references :service_type, foreign_key: true
      t.references :transport_type, foreign_key: true
      t.string :reservation
      t.string :direction
      t.string :pickup_address
      t.string :pickup_contact
      t.string :delivery_address
      t.string :delivery_contact
      t.string :transit_time
      t.decimal :booking_deposit
      t.decimal :balance_on_delivery
      t.decimal :grand_total
      t.decimal :tax
      t.string :year_make_model
      t.string :color
      t.string :vin
      t.string :plate
      t.string :condition
      t.string :estimated_pickup_date
      t.decimal :driver_pay
      t.string :security_question
      t.string :security_password
      t.string :shipping_from_province
      t.string :shipping_from_city
      t.string :shipping_to_province
      t.string :shipping_to_city
      t.text :notes
      t.boolean :no_runner

      t.timestamps
    end
  end
end

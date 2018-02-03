class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :cell_phone
      t.string :phone

      t.timestamps
    end
  end
end

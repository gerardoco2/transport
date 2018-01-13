class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :company_name
      t.string :cell_phone
      t.string :phone
      t.string :website
      t.string :address
      t.integer :number_of_trucks
      t.boolean :non_runners

      t.timestamps
    end
  end
end

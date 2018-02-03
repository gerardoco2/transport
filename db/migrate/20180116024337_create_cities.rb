class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.references :province, foreign_key: true
      t.string :name

      t.timestamps
    end

    def down
    	
    end
  end
end

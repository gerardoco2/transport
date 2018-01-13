class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.references :driver, foreign_key: true
      t.string :province_from
      t.string :city_from
      t.string :province_to
      t.string :city_to

      t.timestamps
    end
  end
end

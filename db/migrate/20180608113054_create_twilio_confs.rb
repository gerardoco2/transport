class CreateTwilioConfs < ActiveRecord::Migration[5.1]
  def change
    create_table :twilio_confs do |t|
      t.string :acct_id
      t.string :auth_token
      t.string :phone_number
      t.boolean :status

      t.timestamps
    end
  end
end

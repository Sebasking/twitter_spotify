class CreateSpotifies < ActiveRecord::Migration[6.0]
  def change
    create_table :spotifies do |t|
      t.string :client_id
      t.string :client_secret
      t.string :access_token
      t.string :refresh_token

      t.timestamps
    end
  end
end

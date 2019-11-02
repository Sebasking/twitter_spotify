class CreateSpotifies < ActiveRecord::Migration[6.0]
  def change
    create_table :spotifies do |t|
      t.string :auth_token
      t.string :refresh_token

      t.timestamps
    end
  end
end

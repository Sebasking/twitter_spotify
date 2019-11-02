class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :spotify_id
      t.string :title
      t.string :artist_name
      t.string :twitter_username

      t.timestamps
    end
  end
end

class Spotify < ApplicationRecord

  def self.find_track(song, artist)
    song_query = song.gsub(' ', '%20')
    artist_query = artist.gsub(' ', '%20')
    url = 'https://api.spotify.com/v1/search?'
    track_query = "q=track:#{song_query}&artist:#{artist_query}"
    type = '&type=track'
    market = '&market=US'

    begin
      resp = RestClient.get("#{url+track_query+type+market}", headers = {
          Authorization: "Bearer #{last.access_token}"
        })
      ConsoleLogger.green(msg: 'SPOTIFY API REQUEST')
      resp_json = JSON.parse(resp.body)

      track_id    = resp_json['tracks']['items'][0]['id']
      title       = resp_json['tracks']['items'][0]['name']
      artist_name = resp_json['tracks']['items'][0]['artists'][0]['name']

      Track.create(
        spotify_id: track_id,
        title: title,
        artist_name: artist_name,
        twitter_username: '@flatironschool_fake_twitter'
      )

      ConsoleLogger.yellow(msg: "SPOTIFY SONG FOUND - #{title}")
    rescue => e
      ConsoleLogger.red(msg: "SPOTIFY API ERROR - #{e}")
    end
  end

  # def self.add_track_to_playlist(track_id, position = 0)
  #   playlist_id = '3DJrkoZIfcrvKwYKrzrNsz'
  #   user_id = 'i44qrghb4ntp2s8b5zfgtw7o4'
  #
  #   body = {
  #     "uris": ["spotify:track:#{track_id}"],
  #     "position": position
  #   }.to_json
  #
  #   resp = RestClient.post("https://api.spotify.com/v1/users/#{user_id}/playlists/#{playlist_id}/tracks", body, headers = {
  #       Authorization: "Bearer #{last.access_token}",
  #       content_type: :json,
  #       accept: :json
  #     })
  #
  #   resp_json = JSON.parse(resp.body)
  #
  #   puts 'COMPLETE'
  # end
end

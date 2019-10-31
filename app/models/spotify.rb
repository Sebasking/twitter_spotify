class Spotify < ApplicationRecord
  def self.find_track(track_params)
    # track_params should look like
    #  { q: 'california+love+tupac'}
    url = 'https://api.spotify.com/v1/search?'
    track_query = track_params.to_query
    type = '&type=track'
    market = '&market=US'

    resp = RestClient.get("#{url+track_query+type+market}", headers = {
        Authorization: 'Bearer ENV[Acces Tokeen]'
      })
    resp_json = JSON.parse(resp.body)

    track_id    = resp_json['tracks']['items'][0]['id']
    title = resp_json['tracks']['items'][0]['name']

    puts 'GOT TRACK'
    add_track_to_playlist(track_id)
  end

  def self.add_track_to_playlist(track_id, position = 0)
    puts 'GOT TRACK'
    playlist_id = '3DJrkoZIfcrvKwYKrzrNsz'
    user_id = 'i44qrghb4ntp2s8b5zfgtw7o4'

    body = {
      "uris": ["spotify:track:#{track_id}"],
      "position": position
    }.to_json

    resp = RestClient.post("https://api.spotify.com/v1/users/#{user_id}/playlists/#{playlist_id}/tracks", body, headers = {
        Authorization: 'Bearer ENV[Acces Tokeen]',
        content_type: :json,
        accept: :json
      })

    resp_json = JSON.parse(resp.body)

    puts 'COMPLETE'
  end
end

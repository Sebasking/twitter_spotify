class SpotifyController < ApplicationController

  def authorize
    body = {
      client_id: Spotify.last.client_id,
      client_secret: Spotify.last.client_secret,
      code: params[:code],
      redirect_uri: 'https://5a8e3b13.ngrok.io/spotify_auth',
      grant_type: 'authorization_code',
    }

    resp = RestClient.post('https://accounts.spotify.com/api/token', body)
    ConsoleLogger.green(msg: 'SPOTIFY API REQUEST')
    auth_params = JSON.parse(resp.body)

    @spotify = Spotify.last
    @spotify.update(
      access_token: auth_params['access_token'],
      refresh_token: auth_params['refresh_token']
    )
  end

  def create
    query_params = {
      client_id: Spotify.last.client_id,
      response_type: "code",
      redirect_uri: 'https://5a8e3b13.ngrok.io/spotify_auth',
      scope: 'playlist-modify-public',
      show_dialog: false
    }

    url = 'https://accounts.spotify.com/authorize/'

    ConsoleLogger.green(msg: 'SPOTIFY API REQUEST')
    redirect_to "#{url}?#{query_params.to_query}"
  end

end

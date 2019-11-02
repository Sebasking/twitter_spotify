class SpotifyController < ApplicationController

  def authorize
    body = {
      client_id: '4eedeb00902c437e8e84b39ae29a85af',
      client_secret: '610e6eca5e094f8d920a089dc619b71c',
      code: params[:code],
      redirect_uri: 'https://5a8e3b13.ngrok.io/spotify_auth',
      grant_type: 'authorization_code',
    }

    resp = RestClient.post('https://accounts.spotify.com/api/token', body)
    ConsoleLogger.green(msg: 'SPOTIFY API REQUEST')
    auth_params = JSON.parse(resp.body)

    @spotify = Spotify.last
    @spotify.update(
      auth_token: auth_params['access_token'],
      refresh_token: auth_params['refresh_token']
    )
  end

  def create
    query_params = {
      client_id: '4eedeb00902c437e8e84b39ae29a85af',
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

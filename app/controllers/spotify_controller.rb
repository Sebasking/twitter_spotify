class SpotifyController < ApplicationController

  def authorize
    body = {
      client_id: '',
      client_secret: '',
      code: params[:code],
      redirect_uri: 'https://09168547.ngrok.io/spotify_auth',
      grant_type: 'authorization_code',
    }

    # conn = Faraday.new(:url => 'https://accounts.spotify.com/api/token/')
    # stuff = conn.post do |req|
    #   req.headers['Content-Type'] = 'application/json'
    #   req.body = body
    # end

    resp = RestClient.post('https://accounts.spotify.com/api/token', body)
    auth_params = JSON.parse(resp.body)
    byebug



  end

  def create
    query_params = {
      client_id: '',
      response_type: "code",
      redirect_uri: 'https://09168547.ngrok.io/spotify_auth',
      scope: 'playlist-modify-public',
      show_dialog: false

    }
    url = 'https://accounts.spotify.com/authorize/'

    puts 'CREATINGGGGGGGGGGGG'

    redirect_to "#{url}?#{query_params.to_query}"
  end


end

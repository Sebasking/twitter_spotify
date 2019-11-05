class TracksController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @tracks = Tracks.all
  end

  def get_tracks
    tracks = Track.all
    render json: {tracks: tracks}, status: 200
  end

  def create
    title = params[:title]
    artist = params[:artist]
    track = Spotify.find_track(title, artist)

    data = ActiveModelSerializers::Adapter::Json.new(
      TrackSerializer.new(track)
    )

    ActionCable.server.broadcast "create_track", data
    head :ok
  end
end

class TracksController < ApplicationController

  def index
    @tracks = Tracks.all
  end

end

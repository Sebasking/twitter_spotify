class BreakthroughController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @tracks = Track.all
  end
end

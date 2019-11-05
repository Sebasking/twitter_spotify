class TrackSerializer < ActiveModel::Serializer
  attributes :id, :spotify_id, :title, :artist_name
end

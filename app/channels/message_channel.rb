class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'create_track'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class FishIndexChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'fish_index_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

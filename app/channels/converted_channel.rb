class ConvertedChannel < ApplicationCable::Channel
  def subscribed
    stream_from "converted_1"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

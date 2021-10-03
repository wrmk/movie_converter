class ConvertedChannel < ApplicationCable::Channel
  def subscribed
    stream_from "converted_#{current_user}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class ConvertVideoJob < ApplicationJob
  queue_as :default

  def perform(storage_id)
    Converter.new.convert(storage_id)
    # ActionCable.server.broadcast("converted_#{current_user}",converted: true)
  end
end

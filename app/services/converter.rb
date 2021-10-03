class Converter
  require 'streamio-ffmpeg'

  def convert(storage_id)
    storage = Storage.find(storage_id)
    gif_path = "tmp/#{SecureRandom.alphanumeric(12)}.gif"
    storage.media.open do |file|
      video = FFMPEG::Movie.new(file.path)
      options = {frame_rate: 5}
      video.transcode(gif_path, options)
      storage.media.attach(io: File.open(gif_path),filename: "file.gif")
    end
  end
end